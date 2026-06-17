import 'package:hive/hive.dart';
import '../models/doctor_model.dart';

class DoctorRepository {
  final Box<DoctorModel> box = Hive.box<DoctorModel>('doctors');

  Future<void> save(DoctorModel doctor) async {
    await box.put(doctor.doctorId, doctor);
  }

  List<DoctorModel> getAll() {
    return box.values.toList();
  }
}
