// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionModelAdapter extends TypeAdapter<SessionModel> {
  @override
  final int typeId = 3;

  @override
  SessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionModel(
      sessionId: fields[0] as String,
      patientId: fields[1] as String,
      doctorId: fields[2] as String,
      deviceId: fields[3] as String,
      totalPressCount: fields[4] as int,
      averageForce: fields[5] as double,
      maxForce: fields[6] as double,
      durationSeconds: fields[7] as int,
      startTime: fields[8] as DateTime,
      endTime: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SessionModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.sessionId)
      ..writeByte(1)
      ..write(obj.patientId)
      ..writeByte(2)
      ..write(obj.doctorId)
      ..writeByte(3)
      ..write(obj.deviceId)
      ..writeByte(4)
      ..write(obj.totalPressCount)
      ..writeByte(5)
      ..write(obj.averageForce)
      ..writeByte(6)
      ..write(obj.maxForce)
      ..writeByte(7)
      ..write(obj.durationSeconds)
      ..writeByte(8)
      ..write(obj.startTime)
      ..writeByte(9)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
