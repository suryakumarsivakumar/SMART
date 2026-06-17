import 'package:hive/hive.dart';

part 'device_model.g.dart';

@HiveType(typeId: 2)
class DeviceModel extends HiveObject {
  @HiveField(0)
  String deviceId;

  @HiveField(1)
  String deviceName;

  @HiveField(2)
  String ipAddress;

  @HiveField(3)
  bool connected;

  @HiveField(4)
  DateTime lastSeen;
  @HiveField(5)
  String instrumentName;

  @HiveField(6)
  DateTime sterilizationDate;

  @HiveField(7)
  bool isReused;

  @HiveField(8)
  int reuseCount;

  DeviceModel({
    required this.deviceId,
    required this.deviceName,
    required this.ipAddress,
    required this.connected,
    required this.lastSeen,
    required this.instrumentName,
    required this.sterilizationDate,
    required this.isReused,
    required this.reuseCount,
  });
}
