import 'dart:async';
import '../../../core/enums/biopsy_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../models/device_data_model.dart';
import '../models/session_model.dart';
import '../models/force_data_model.dart';
import '../models/timeline_event_model.dart';
import '../models/graph_point.dart';
import '../features/device/biopsy/biopsy_processor.dart';
import '../features/device/biopsy/biopsy_result.dart';
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
  final DateFormat _dateTimeFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
  final Esp32Service _service;
  final Ref ref;

  final SessionRepository _sessionRepository = SessionRepository();
  final AnalyticsRepository _analyticsRepository = AnalyticsRepository();

  final Box<TimelineEventModel> timelineBox = Hive.box<TimelineEventModel>(
    'timeline_events',
  );

  final List<GraphPoint> _graphPoints = [];

  double _graphX = 0;

  final BiopsyProcessor _biopsyProcessor = BiopsyProcessor();

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

  // ===================================================
  // CONNECTION TEST ONLY
  // ===================================================

  Future<bool> checkConnectionOnly() async {
    return await _service.testConnection();
  }

  // ===================================================
  // START MONITORING
  // ===================================================

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

    _biopsyProcessor.reset();

    _previousClick = false;

    _graphPoints.clear();

    _graphX = 0;

    _firedTimer?.cancel();

    state = DashboardState.initial();

    _startTime = DateTime.now();
    ref.read(sessionProvider.notifier).startProcedure();

    final session = ref.read(sessionProvider);

    currentSession = SessionModel(
      sessionId: const Uuid().v4(),

      patientId: session.patient?.patientId ?? 'UNKNOWN_PATIENT',

      doctorId: session.doctor?.doctorId ?? 'UNKNOWN_DOCTOR',

      deviceId: session.deviceName ?? 'BIOPSY_DEVICE',

      patientName: session.patient?.patientName ?? 'Unknown Patient',

      doctorName: session.doctor?.doctorName ?? 'Unknown Doctor',

      deviceName: session.deviceName ?? 'Unknown Device',

      uhid: session.patient?.uhid ?? '',

      ipNumber: session.patient?.ipNumber ?? '',

      admissionNumber: session.patient?.admissionNumber ?? '',

      ward: session.patient?.ward ?? '',

      bedNumber: session.patient?.bedNumber ?? '',

      bedType: session.patient?.bedType ?? '',

      procedureName: session.patient?.procedureName ?? '',

      dob: session.patient?.dob ?? DateTime.now(),

      age: session.patient?.age ?? 0,

      gender: session.patient?.gender ?? '',

      mobileNumber: session.patient?.mobileNumber ?? '',

      hospitalName: session.patient?.hospitalName ?? '',

      department: session.patient?.department ?? '',

      diagnosis: session.patient?.diagnosis ?? '',

      notes: session.patient?.notes ?? '',

      doctorHospital: session.doctor?.hospital ?? '',

      specialization: session.doctor?.specialization ?? '',

      contactNumber: session.doctor?.contactNumber ?? '',

      anesthetistName: session.doctor?.anesthetistName ?? '',

      otInchargeName: session.doctor?.otInchargeName ?? '',

      surgeryType: session.doctor?.surgeryType ?? '',

      totalPressCount: 0,
      totalSamples: 0,
      averageForce: 0,
      maxForce: 0,
      durationSeconds: 0,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      timelineEvents: [],
    );

    _service.startMonitoring();

    _subscription = _service.dataStream.listen(_processData);

    return true;
  }

  void _processData(DeviceDataModel data) {
    print('CLICK=${data.click}  VALUE=${data.value}  STATE=${data.state}');
    if (data.click && !_previousClick) {
      print('CLICK DETECTED');
      _pressCount++;

      final BiopsyResult result = _biopsyProcessor.handleClick();
      print('BIOPSY STATE=${result.state}  SAMPLES=${result.sampleCount}');

      if (result.state == BiopsyState.fired) {
        _firedTimer?.cancel();

        _firedTimer = Timer(const Duration(seconds: 5), () {
          _biopsyProcessor.setFree();

          state = state.copyWith(biopsyState: _biopsyProcessor.result.state);
        });
      }

      if (result.sampleCount > state.biopsySampleCount) {
        ref.read(sessionProvider.notifier).recordSample(result.sampleCount);
      }
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
      biopsyState: _biopsyProcessor.result.state,
      graphPoints: List.from(_graphPoints),
      biopsySampleCount: _biopsyProcessor.result.sampleCount,
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
    ref.read(sessionProvider.notifier).endProcedure();

    if (currentSession != null) {
      final sessionData = ref.read(sessionProvider);

      currentSession!
        ..totalPressCount = _pressCount
        ..totalSamples = state.biopsySampleCount
        ..averageForce = (_sampleCount == 0) ? 0 : _forceSum / _sampleCount
        ..maxForce = _maxForce
        ..durationSeconds = DateTime.now().difference(_startTime!).inSeconds
        ..endTime = DateTime.now()
        ..timelineEvents = sessionData.timeline
            .map((e) => '${_dateTimeFormat.format(e.timestamp)} - ${e.event}')
            .toList();

      await _sessionRepository.save(currentSession!);
    } else {}

    state = state.copyWith(procedureEnded: true);
  }
}
