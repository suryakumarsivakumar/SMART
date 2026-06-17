// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'force_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForceDataModelAdapter extends TypeAdapter<ForceDataModel> {
  @override
  final int typeId = 4;

  @override
  ForceDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForceDataModel(
      force: fields[0] as double,
      timestamp: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ForceDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.force)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForceDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
