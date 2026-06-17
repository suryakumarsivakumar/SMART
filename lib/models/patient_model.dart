import 'package:hive/hive.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 0)
class PatientModel extends HiveObject {
  @HiveField(0)
  String patientId;

  @HiveField(1)
  String patientName;

  @HiveField(2)
  int age;

  @HiveField(3)
  String gender;

  @HiveField(4)
  String mobileNumber;

  @HiveField(5)
  String hospitalName;

  @HiveField(6)
  String department;

  @HiveField(7)
  String diagnosis;

  @HiveField(8)
  String notes;

  PatientModel({
    required this.patientId,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.mobileNumber,
    required this.hospitalName,
    required this.department,
    required this.diagnosis,
    required this.notes,
  });
}
