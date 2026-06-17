import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../core/enums/biopsy_state.dart';

import '../models/device_data_model.dart';
import '../models/session_model.dart';
import '../models/force_data_model.dart';
import '../models/timeline_event_model.dart';
import '../models/graph_point.dart';

import '../repositories/session_repository.dart';
import '../repositories/analytics_repository.dart';

import '../services/wifi/esp32_service.dart';

import 'dashboard_state.dart';
import 'service_provider.dart';
import 'session_provider.dart';

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
      return DashboardNotifier(ref.read(esp32ServiceProvider), ref);
    });

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier(this._service, this.ref) : super(DashboardState.initial());

  final Esp32Service _service;
  final Ref ref;

  final SessionRepository _sessionRepository = SessionRepository();
  final AnalyticsRepository _analyticsRepository = AnalyticsRepository();

  final Box<TimelineEventModel> timelineBox = Hive.box<TimelineEventModel>(
    'timeline_events',
  );

  final List<GraphPoint> _graphPoints = [];

  double _graphX = 0;

  BiopsyState biopsyState = BiopsyState.free;

  int biopsySampleCount = 0;

  bool _previousClick = false;

  Timer? _firedTimer;

  SessionModel? currentSession;

  String? _lastState;

  StreamSubscription? _subscription;

  int _pressCount = 0;

  double _maxForce = 0;

  double _forceSum = 0;

  int _sampleCount = 0;

  DateTime? _startTime;

  Future<bool> startMonitoring() async {
    final connected = await _service.testConnection();

    if (!connected) {
      return false;
    }

    // RESET EVERYTHING FOR NEW PROCEDURE

    _pressCount = 0;
    _maxForce = 0;
    _forceSum = 0;
    _sampleCount = 0;

    _lastState = null;

    biopsyState = BiopsyState.free;

    biopsySampleCount = 0;

    _previousClick = false;

    _graphPoints.clear();

    _graphX = 0;

    _firedTimer?.cancel();

    state = DashboardState.initial();

    _startTime = DateTime.now();

    final session = ref.read(sessionProvider);

    currentSession = SessionModel(
      sessionId: const Uuid().v4(),

      patientId: session.patient?.patientId ?? 'UNKNOWN_PATIENT',

      doctorId: session.doctor?.doctorId ?? 'UNKNOWN_DOCTOR',

      deviceId: session.deviceName ?? 'BIOPSY_DEVICE',

      totalPressCount: 0,
      averageForce: 0,
      maxForce: 0,
      durationSeconds: 0,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    );

    _service.startMonitoring();

    _subscription = _service.dataStream.listen(_processData);

    return true;
  }

  void _handleBiopsyClick() {
    switch (biopsyState) {
      case BiopsyState.free:
        biopsyState = BiopsyState.armed;
        break;

      case BiopsyState.armed:
        biopsyState = BiopsyState.fired;

        biopsySampleCount++;

        _firedTimer?.cancel();

        _firedTimer = Timer(const Duration(seconds: 5), () {
          biopsyState = BiopsyState.free;

          state = state.copyWith(biopsyState: biopsyState);
        });

        break;

      case BiopsyState.fired:
        break;
    }
  }

  void _processData(DeviceDataModel data) {
    if (data.click && !_previousClick) {
      _pressCount++;

      _handleBiopsyClick();
    }

    _previousClick = data.click;

    _sampleCount++;

    _forceSum += data.value;

    _graphX++;

    _graphPoints.add(GraphPoint(x: _graphX, y: data.value.toDouble()));

    if (_graphPoints.length > 100) {
      _graphPoints.removeAt(0);
    }

    if (data.value > _maxForce) {
      _maxForce = data.value.toDouble();
    }

    _analyticsRepository.saveForce(
      ForceDataModel(force: data.value.toDouble(), timestamp: DateTime.now()),
    );

    if (_lastState != data.state) {
      timelineBox.add(
        TimelineEventModel(event: data.state, timestamp: DateTime.now()),
      );

      _lastState = data.state;
    }

    final average = _forceSum / _sampleCount;

    final duration = DateTime.now().difference(_startTime!);

    state = state.copyWith(
      biopsyState: biopsyState,
      graphPoints: List.from(_graphPoints),
      biopsySampleCount: biopsySampleCount,
      latestData: data,
      totalPressCount: _pressCount,
      averageForce: average,
      maxForce: _maxForce,
      usageDuration: duration,
    );
  }

  Future<void> stopMonitoring() async {
    _service.stopMonitoring();

    await _subscription?.cancel();

    if (currentSession != null) {
      currentSession!
        ..totalPressCount = _pressCount
        ..averageForce = (_sampleCount == 0) ? 0 : _forceSum / _sampleCount
        ..maxForce = _maxForce
        ..durationSeconds = DateTime.now().difference(_startTime!).inSeconds
        ..endTime = DateTime.now();

      await _sessionRepository.save(currentSession!);
    }

    state = state.copyWith(procedureEnded: true);
  }
}
