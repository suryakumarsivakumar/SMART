import 'package:hive/hive.dart';

part 'doctor_model.g.dart';

@HiveType(typeId: 1)
class DoctorModel extends HiveObject {
  @HiveField(0)
  String doctorId;

  @HiveField(1)
  String doctorName;

  @HiveField(2)
  String hospital;

  @HiveField(3)
  String department;

  @HiveField(4)
  String specialization;

  @HiveField(5)
  String contactNumber;

  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.hospital,
    required this.department,
    required this.specialization,
    required this.contactNumber,
  });
}
