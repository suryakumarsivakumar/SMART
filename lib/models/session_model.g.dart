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
      patientName: fields[11] as String,
      doctorName: fields[12] as String,
      deviceName: fields[13] as String,
      totalPressCount: fields[4] as int,
      totalSamples: fields[5] as int,
      averageForce: fields[6] as double,
      maxForce: fields[7] as double,
      durationSeconds: fields[8] as int,
      startTime: fields[9] as DateTime,
      endTime: fields[10] as DateTime,
      uhid: fields[14] as String,
      ipNumber: fields[15] as String,
      admissionNumber: fields[16] as String,
      ward: fields[17] as String,
      bedNumber: fields[18] as String,
      bedType: fields[19] as String,
      procedureName: fields[20] as String,
      dob: fields[21] as DateTime,
      age: fields[22] as int,
      gender: fields[23] as String,
      mobileNumber: fields[24] as String,
      hospitalName: fields[25] as String,
      department: fields[26] as String,
      diagnosis: fields[27] as String,
      notes: fields[28] as String,
      doctorHospital: fields[29] as String,
      specialization: fields[30] as String,
      contactNumber: fields[31] as String,
      anesthetistName: fields[32] as String,
      otInchargeName: fields[33] as String,
      surgeryType: fields[34] as String,
      timelineEvents: (fields[35] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SessionModel obj) {
    writer
      ..writeByte(36)
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
      ..write(obj.totalSamples)
      ..writeByte(6)
      ..write(obj.averageForce)
      ..writeByte(7)
      ..write(obj.maxForce)
      ..writeByte(8)
      ..write(obj.durationSeconds)
      ..writeByte(9)
      ..write(obj.startTime)
      ..writeByte(10)
      ..write(obj.endTime)
      ..writeByte(11)
      ..write(obj.patientName)
      ..writeByte(12)
      ..write(obj.doctorName)
      ..writeByte(13)
      ..write(obj.deviceName)
      ..writeByte(14)
      ..write(obj.uhid)
      ..writeByte(15)
      ..write(obj.ipNumber)
      ..writeByte(16)
      ..write(obj.admissionNumber)
      ..writeByte(17)
      ..write(obj.ward)
      ..writeByte(18)
      ..write(obj.bedNumber)
      ..writeByte(19)
      ..write(obj.bedType)
      ..writeByte(20)
      ..write(obj.procedureName)
      ..writeByte(21)
      ..write(obj.dob)
      ..writeByte(22)
      ..write(obj.age)
      ..writeByte(23)
      ..write(obj.gender)
      ..writeByte(24)
      ..write(obj.mobileNumber)
      ..writeByte(25)
      ..write(obj.hospitalName)
      ..writeByte(26)
      ..write(obj.department)
      ..writeByte(27)
      ..write(obj.diagnosis)
      ..writeByte(28)
      ..write(obj.notes)
      ..writeByte(29)
      ..write(obj.doctorHospital)
      ..writeByte(30)
      ..write(obj.specialization)
      ..writeByte(31)
      ..write(obj.contactNumber)
      ..writeByte(32)
      ..write(obj.anesthetistName)
      ..writeByte(33)
      ..write(obj.otInchargeName)
      ..writeByte(34)
      ..write(obj.surgeryType)
      ..writeByte(35)
      ..write(obj.timelineEvents);
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
