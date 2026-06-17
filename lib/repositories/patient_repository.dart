import 'package:hive/hive.dart';
import '../models/patient_model.dart';

class PatientRepository {
  final Box<PatientModel> box = Hive.box<PatientModel>('patients');

  Future<void> save(PatientModel patient) async {
    await box.put(patient.patientId, patient);
  }

  List<PatientModel> getAll() {
    return box.values.toList();
  }

  PatientModel? getById(String id) {
    return box.get(id);
  }
}
