import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/timeline_event_model.dart';
import '../models/patient_model.dart';
import '../models/doctor_model.dart';

class SessionData {
  final PatientModel? patient;
  final DoctorModel? doctor;
  final String? deviceName;

  final DateTime? startTime;
  final DateTime? endTime;

  final List<TimelineEventModel> timeline;

  SessionData({
    this.patient,
    this.doctor,
    this.deviceName,
    this.startTime,
    this.endTime,
    this.timeline = const [],
  });

  SessionData copyWith({
    PatientModel? patient,
    DoctorModel? doctor,
    String? deviceName,
    DateTime? startTime,
    DateTime? endTime,
    List<TimelineEventModel>? timeline,
  }) {
    return SessionData(
      patient: patient ?? this.patient,
      doctor: doctor ?? this.doctor,
      deviceName: deviceName ?? this.deviceName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      timeline: timeline ?? this.timeline,
    );
  }
}

class SessionNotifier extends StateNotifier<SessionData> {
  SessionNotifier() : super(SessionData());

  void savePatient(PatientModel patient) {
    state = state.copyWith(patient: patient);
  }

  void saveDoctor(DoctorModel doctor) {
    state = state.copyWith(doctor: doctor);
  }

  void saveDevice(String device) {
    state = state.copyWith(deviceName: device);
  }

  // ==========================================
  // PROCEDURE START
  // ==========================================

  void startProcedure() {
    state = state.copyWith(
      startTime: DateTime.now(),
      timeline: [
        ...state.timeline,
        TimelineEventModel(
          timestamp: DateTime.now(),
          event: 'Procedure Started',
        ),
      ],
    );
  }

  // ==========================================
  // SAMPLE COLLECTED
  // ==========================================

  void recordSample(int sampleNumber) {
    state = state.copyWith(
      timeline: [
        ...state.timeline,
        TimelineEventModel(
          timestamp: DateTime.now(),
          event: 'Sample $sampleNumber Collected',
        ),
      ],
    );
  }

  // ==========================================
  // PROCEDURE END
  // ==========================================

  void endProcedure() {
    state = state.copyWith(
      endTime: DateTime.now(),
      timeline: [
        ...state.timeline,
        TimelineEventModel(
          timestamp: DateTime.now(),
          event: 'Procedure Completed',
        ),
      ],
    );
  }
}

final sessionProvider = StateNotifierProvider<SessionNotifier, SessionData>(
  (ref) => SessionNotifier(),
);
