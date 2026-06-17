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

  DeviceModel({
    required this.deviceId,
    required this.deviceName,
    required this.ipAddress,
    required this.connected,
    required this.lastSeen,
  });
}
