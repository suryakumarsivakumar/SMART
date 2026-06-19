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
      patientName: fields[10] as String,
      doctorName: fields[11] as String,
      deviceName: fields[12] as String,
      totalPressCount: fields[4] as int,
      averageForce: fields[5] as double,
      maxForce: fields[6] as double,
      durationSeconds: fields[7] as int,
      startTime: fields[8] as DateTime,
      endTime: fields[9] as DateTime,
      uhid: fields[13] as String,
      ipNumber: fields[14] as String,
      admissionNumber: fields[15] as String,
      ward: fields[16] as String,
      bedNumber: fields[17] as String,
      bedType: fields[18] as String,
      procedureName: fields[19] as String,
      dob: fields[20] as DateTime,
      age: fields[21] as int,
      gender: fields[22] as String,
      mobileNumber: fields[23] as String,
      hospitalName: fields[24] as String,
      department: fields[25] as String,
      diagnosis: fields[26] as String,
      notes: fields[27] as String,
      doctorHospital: fields[28] as String,
      specialization: fields[29] as String,
      contactNumber: fields[30] as String,
      anesthetistName: fields[31] as String,
      otInchargeName: fields[32] as String,
      surgeryType: fields[33] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SessionModel obj) {
    writer
      ..writeByte(34)
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
      ..write(obj.endTime)
      ..writeByte(10)
      ..write(obj.patientName)
      ..writeByte(11)
      ..write(obj.doctorName)
      ..writeByte(12)
      ..write(obj.deviceName)
      ..writeByte(13)
      ..write(obj.uhid)
      ..writeByte(14)
      ..write(obj.ipNumber)
      ..writeByte(15)
      ..write(obj.admissionNumber)
      ..writeByte(16)
      ..write(obj.ward)
      ..writeByte(17)
      ..write(obj.bedNumber)
      ..writeByte(18)
      ..write(obj.bedType)
      ..writeByte(19)
      ..write(obj.procedureName)
      ..writeByte(20)
      ..write(obj.dob)
      ..writeByte(21)
      ..write(obj.age)
      ..writeByte(22)
      ..write(obj.gender)
      ..writeByte(23)
      ..write(obj.mobileNumber)
      ..writeByte(24)
      ..write(obj.hospitalName)
      ..writeByte(25)
      ..write(obj.department)
      ..writeByte(26)
      ..write(obj.diagnosis)
      ..writeByte(27)
      ..write(obj.notes)
      ..writeByte(28)
      ..write(obj.doctorHospital)
      ..writeByte(29)
      ..write(obj.specialization)
      ..writeByte(30)
      ..write(obj.contactNumber)
      ..writeByte(31)
      ..write(obj.anesthetistName)
      ..writeByte(32)
      ..write(obj.otInchargeName)
      ..writeByte(33)
      ..write(obj.surgeryType);
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
