import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient_model.dart';
import '../models/doctor_model.dart';

class SessionData {
  final PatientModel? patient;
  final DoctorModel? doctor;
  final String? deviceName;

  SessionData({this.patient, this.doctor, this.deviceName});

  SessionData copyWith({
    PatientModel? patient,
    DoctorModel? doctor,
    String? deviceName,
  }) {
    return SessionData(
      patient: patient ?? this.patient,
      doctor: doctor ?? this.doctor,
      deviceName: deviceName ?? this.deviceName,
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
}

final sessionProvider = StateNotifierProvider<SessionNotifier, SessionData>(
  (ref) => SessionNotifier(),
);
