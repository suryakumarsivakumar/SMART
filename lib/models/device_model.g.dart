// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceModelAdapter extends TypeAdapter<DeviceModel> {
  @override
  final int typeId = 2;

  @override
  DeviceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceModel(
      deviceId: fields[0] as String,
      deviceName: fields[1] as String,
      ipAddress: fields[2] as String,
      connected: fields[3] as bool,
      lastSeen: fields[4] as DateTime,
      instrumentName: fields[5] as String,
      sterilizationDate: fields[6] as DateTime,
      isReused: fields[7] as bool,
      reuseCount: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.deviceId)
      ..writeByte(1)
      ..write(obj.deviceName)
      ..writeByte(2)
      ..write(obj.ipAddress)
      ..writeByte(3)
      ..write(obj.connected)
      ..writeByte(4)
      ..write(obj.lastSeen)
      ..writeByte(5)
      ..write(obj.instrumentName)
      ..writeByte(6)
      ..write(obj.sterilizationDate)
      ..writeByte(7)
      ..write(obj.isReused)
      ..writeByte(8)
      ..write(obj.reuseCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
