import 'package:hive_flutter/hive_flutter.dart';

import '../../models/patient_model.dart';
import '../../models/doctor_model.dart';
import '../../models/device_model.dart';
import '../../models/session_model.dart';
import '../../models/force_data_model.dart';
import '../../models/timeline_event_model.dart';
import '../../models/recording_model.dart';

class HiveService {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PatientModelAdapter());
    Hive.registerAdapter(DoctorModelAdapter());
    Hive.registerAdapter(DeviceModelAdapter());
    Hive.registerAdapter(SessionModelAdapter());
    Hive.registerAdapter(ForceDataModelAdapter());
    Hive.registerAdapter(TimelineEventModelAdapter());
    Hive.registerAdapter(RecordingModelAdapter());

    await Hive.openBox<PatientModel>('patients');
    await Hive.openBox<DoctorModel>('doctors');
    await Hive.openBox<DeviceModel>('devices');
    await Hive.openBox<SessionModel>('sessions');
    await Hive.openBox<ForceDataModel>('force_data');
    await Hive.openBox<TimelineEventModel>('timeline_events');
    await Hive.openBox<RecordingModel>('recordings');
  }
}
