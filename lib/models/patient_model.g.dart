// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatientModelAdapter extends TypeAdapter<PatientModel> {
  @override
  final int typeId = 0;

  @override
  PatientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientModel(
      uhid: fields[9] as String,
      ipNumber: fields[10] as String,
      admissionNumber: fields[11] as String,
      ward: fields[12] as String,
      bedNumber: fields[13] as String,
      bedType: fields[14] as String,
      procedureName: fields[15] as String,
      dob: fields[16] as DateTime,
      patientId: fields[0] as String,
      patientName: fields[1] as String,
      age: fields[2] as int,
      gender: fields[3] as String,
      mobileNumber: fields[4] as String,
      hospitalName: fields[5] as String,
      department: fields[6] as String,
      diagnosis: fields[7] as String,
      notes: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PatientModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.patientId)
      ..writeByte(1)
      ..write(obj.patientName)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.mobileNumber)
      ..writeByte(5)
      ..write(obj.hospitalName)
      ..writeByte(6)
      ..write(obj.department)
      ..writeByte(7)
      ..write(obj.diagnosis)
      ..writeByte(8)
      ..write(obj.notes)
      ..writeByte(9)
      ..write(obj.uhid)
      ..writeByte(10)
      ..write(obj.ipNumber)
      ..writeByte(11)
      ..write(obj.admissionNumber)
      ..writeByte(12)
      ..write(obj.ward)
      ..writeByte(13)
      ..write(obj.bedNumber)
      ..writeByte(14)
      ..write(obj.bedType)
      ..writeByte(15)
      ..write(obj.procedureName)
      ..writeByte(16)
      ..write(obj.dob);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
