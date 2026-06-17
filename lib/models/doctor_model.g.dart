// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorModelAdapter extends TypeAdapter<DoctorModel> {
  @override
  final int typeId = 1;

  @override
  DoctorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorModel(
      doctorId: fields[0] as String,
      doctorName: fields[1] as String,
      hospital: fields[2] as String,
      department: fields[3] as String,
      specialization: fields[4] as String,
      contactNumber: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.doctorId)
      ..writeByte(1)
      ..write(obj.doctorName)
      ..writeByte(2)
      ..write(obj.hospital)
      ..writeByte(3)
      ..write(obj.department)
      ..writeByte(4)
      ..write(obj.specialization)
      ..writeByte(5)
      ..write(obj.contactNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
