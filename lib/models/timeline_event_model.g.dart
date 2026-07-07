// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineEventModelAdapter extends TypeAdapter<TimelineEventModel> {
  @override
  final int typeId = 5;

  @override
  TimelineEventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineEventModel(
      device: fields[0] as String,
      event: fields[1] as String,
      timestamp: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineEventModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.device)
      ..writeByte(1)
      ..write(obj.event)
      ..writeByte(2)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineEventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
