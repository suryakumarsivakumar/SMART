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

  SessionModel({
    required this.sessionId,
    required this.patientId,
    required this.doctorId,
    required this.deviceId,
    required this.totalPressCount,
    required this.averageForce,
    required this.maxForce,
    required this.durationSeconds,
    required this.startTime,
    required this.endTime,
  });
}
