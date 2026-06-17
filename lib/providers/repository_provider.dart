import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/patient_repository.dart';
import '../repositories/doctor_repository.dart';
import '../repositories/session_repository.dart';
import '../repositories/analytics_repository.dart';

final patientRepositoryProvider = Provider<PatientRepository>(
  (_) => PatientRepository(),
);

final doctorRepositoryProvider = Provider<DoctorRepository>(
  (_) => DoctorRepository(),
);

final sessionRepositoryProvider = Provider<SessionRepository>(
  (_) => SessionRepository(),
);

final analyticsRepositoryProvider = Provider<AnalyticsRepository>(
  (_) => AnalyticsRepository(),
);
