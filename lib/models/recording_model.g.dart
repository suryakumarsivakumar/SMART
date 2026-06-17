// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordingModelAdapter extends TypeAdapter<RecordingModel> {
  @override
  final int typeId = 6;

  @override
  RecordingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordingModel(
      recordingId: fields[0] as String,
      sessionId: fields[1] as String,
      videoPath: fields[2] as String,
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RecordingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.recordingId)
      ..writeByte(1)
      ..write(obj.sessionId)
      ..writeByte(2)
      ..write(obj.videoPath)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
