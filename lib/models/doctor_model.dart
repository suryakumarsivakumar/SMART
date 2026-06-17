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
  @HiveField(6)
  String anesthetistName;

  @HiveField(7)
  String otInchargeName;

  @HiveField(8)
  String surgeryType;
  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.hospital,
    required this.department,
    required this.specialization,
    required this.contactNumber,
    required this.anesthetistName,
    required this.otInchargeName,
    required this.surgeryType,
  });
}
