import 'package:hive/hive.dart';

part 'session_model.g.dart';

@HiveType(typeId: 3)
class SessionModel extends HiveObject {
  @HiveField(0)
  String sessionId;

  @HiveField(1)
  String patientId;

  @HiveField(2)
  String doctorId;

  @HiveField(3)
  String deviceId;

  @HiveField(4)
  int totalPressCount;

  @HiveField(5)
  double averageForce;

  @HiveField(6)
  double maxForce;

  @HiveField(7)
  int durationSeconds;

  @HiveField(8)
  DateTime startTime;

  @HiveField(9)
  DateTime endTime;

  @HiveField(10)
  String patientName;

  @HiveField(11)
  String doctorName;

  @HiveField(12)
  String deviceName;

  // ===================================================
  // PATIENT DETAILS
  // ===================================================

  @HiveField(13)
  String uhid;

  @HiveField(14)
  String ipNumber;

  @HiveField(15)
  String admissionNumber;

  @HiveField(16)
  String ward;

  @HiveField(17)
  String bedNumber;

  @HiveField(18)
  String bedType;

  @HiveField(19)
  String procedureName;

  @HiveField(20)
  DateTime dob;

  @HiveField(21)
  int age;

  @HiveField(22)
  String gender;

  @HiveField(23)
  String mobileNumber;

  @HiveField(24)
  String hospitalName;

  @HiveField(25)
  String department;

  @HiveField(26)
  String diagnosis;

  @HiveField(27)
  String notes;

  // ===================================================
  // DOCTOR DETAILS
  // ===================================================

  @HiveField(28)
  String doctorHospital;

  @HiveField(29)
  String specialization;

  @HiveField(30)
  String contactNumber;

  @HiveField(31)
  String anesthetistName;

  @HiveField(32)
  String otInchargeName;

  @HiveField(33)
  String surgeryType;

  SessionModel({
    required this.sessionId,
    required this.patientId,
    required this.doctorId,
    required this.deviceId,

    required this.patientName,
    required this.doctorName,
    required this.deviceName,

    required this.totalPressCount,
    required this.averageForce,
    required this.maxForce,
    required this.durationSeconds,
    required this.startTime,
    required this.endTime,

    // Patient
    required this.uhid,
    required this.ipNumber,
    required this.admissionNumber,
    required this.ward,
    required this.bedNumber,
    required this.bedType,
    required this.procedureName,
    required this.dob,
    required this.age,
    required this.gender,
    required this.mobileNumber,
    required this.hospitalName,
    required this.department,
    required this.diagnosis,
    required this.notes,

    // Doctor
    required this.doctorHospital,
    required this.specialization,
    required this.contactNumber,
    required this.anesthetistName,
    required this.otInchargeName,
    required this.surgeryType,
  });
}
