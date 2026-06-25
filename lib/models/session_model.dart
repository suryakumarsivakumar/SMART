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
  int totalSamples;

  @HiveField(6)
  double averageForce;

  @HiveField(7)
  double maxForce;

  @HiveField(8)
  int durationSeconds;

  @HiveField(9)
  DateTime startTime;

  @HiveField(10)
  DateTime endTime;

  @HiveField(11)
  String patientName;

  @HiveField(12)
  String doctorName;

  @HiveField(13)
  String deviceName;

  // ===================================================
  // PATIENT DETAILS
  // ===================================================

  @HiveField(14)
  String uhid;

  @HiveField(15)
  String ipNumber;

  @HiveField(16)
  String admissionNumber;

  @HiveField(17)
  String ward;

  @HiveField(18)
  String bedNumber;

  @HiveField(19)
  String bedType;

  @HiveField(20)
  String procedureName;

  @HiveField(21)
  DateTime dob;

  @HiveField(22)
  int age;

  @HiveField(23)
  String gender;

  @HiveField(24)
  String mobileNumber;

  @HiveField(25)
  String hospitalName;

  @HiveField(26)
  String department;

  @HiveField(27)
  String diagnosis;

  @HiveField(28)
  String notes;

  // ===================================================
  // DOCTOR DETAILS
  // ===================================================

  @HiveField(29)
  String doctorHospital;

  @HiveField(30)
  String specialization;

  @HiveField(31)
  String contactNumber;

  @HiveField(32)
  String anesthetistName;

  @HiveField(33)
  String otInchargeName;

  @HiveField(34)
  String surgeryType;
  @HiveField(35)
  List<String> timelineEvents;

  SessionModel({
    required this.sessionId,
    required this.patientId,
    required this.doctorId,
    required this.deviceId,

    required this.patientName,
    required this.doctorName,
    required this.deviceName,

    required this.totalPressCount,
    required this.totalSamples,
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
    required this.timelineEvents,
  });
}
