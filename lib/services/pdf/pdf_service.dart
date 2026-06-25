import 'dart:io';

import 'package:open_filex/open_filex.dart';

import '../../models/pdf_report_data.dart';
import '../../models/session_model.dart';
import '../../providers/session_provider.dart';
import 'package:intl/intl.dart';
import 'pdf_builder.dart';

class PdfService {
  final DateFormat _dateTimeFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
  //=====================================================
  // DASHBOARD REPORT
  //=====================================================

  Future<File> generateReport({
    required SessionData session,
    required int totalPresses,
    required int totalSamples,
    required double averageForce,
    required double maximumForce,
    required Duration duration,
  }) async {
    final report = PdfReportData(
      //-----------------------------
      // Patient
      //-----------------------------
      patientName: session.patient?.patientName ?? '',
      patientId: session.patient?.patientId ?? '',
      uhid: session.patient?.uhid ?? '',
      ipNumber: session.patient?.ipNumber ?? '',
      admissionNumber: session.patient?.admissionNumber ?? '',
      ward: session.patient?.ward ?? '',
      bedNumber: session.patient?.bedNumber ?? '',
      bedType: session.patient?.bedType ?? '',
      procedureName: session.patient?.procedureName ?? '',
      dob: session.patient?.dob,
      age: session.patient?.age ?? 0,
      gender: session.patient?.gender ?? '',
      mobileNumber: session.patient?.mobileNumber ?? '',
      hospitalName: session.patient?.hospitalName ?? '',
      department: session.patient?.department ?? '',
      diagnosis: session.patient?.diagnosis ?? '',
      notes: session.patient?.notes ?? '',

      //-----------------------------
      // Doctor
      //-----------------------------
      doctorName: session.doctor?.doctorName ?? '',
      doctorId: session.doctor?.doctorId ?? '',
      doctorHospital: session.doctor?.hospital ?? '',
      doctorDepartment: session.doctor?.department ?? '',
      specialization: session.doctor?.specialization ?? '',
      contactNumber: session.doctor?.contactNumber ?? '',
      anesthetistName: session.doctor?.anesthetistName ?? '',
      otInchargeName: session.doctor?.otInchargeName ?? '',
      surgeryType: session.doctor?.surgeryType ?? '',

      //-----------------------------
      // Device
      //-----------------------------
      deviceName: session.deviceName ?? '',
      deviceId: session.deviceName ?? '',

      //-----------------------------
      // Analytics
      //-----------------------------
      totalSamples: totalSamples,
      totalPresses: totalPresses,
      averageForce: averageForce,
      maximumForce: maximumForce,
      duration: duration,

      //-----------------------------
      // Timing
      //-----------------------------
      startTime: session.startTime,
      endTime: session.endTime,
      reportGenerated: DateTime.now(),

      //-----------------------------
      // Timeline
      //-----------------------------
      timeline: session.timeline
          .map((e) => '${_dateTimeFormat.format(e.timestamp)} - ${e.event}')
          .toList(),
    );

    return _saveAndOpen(report);
  }

  //=====================================================
  // HISTORY REPORT
  //=====================================================

  Future<File> generateSessionReport(SessionModel session) async {
    final report = PdfReportData(
      //-----------------------------
      // Patient
      //-----------------------------
      patientName: session.patientName,
      patientId: session.patientId,
      uhid: session.uhid,
      ipNumber: session.ipNumber,
      admissionNumber: session.admissionNumber,
      ward: session.ward,
      bedNumber: session.bedNumber,
      bedType: session.bedType,
      procedureName: session.procedureName,
      dob: session.dob,
      age: session.age,
      gender: session.gender,
      mobileNumber: session.mobileNumber,
      hospitalName: session.hospitalName,
      department: session.department,
      diagnosis: session.diagnosis,
      notes: session.notes,

      //-----------------------------
      // Doctor
      //-----------------------------
      doctorName: session.doctorName,
      doctorId: session.doctorId,
      doctorHospital: session.doctorHospital,
      doctorDepartment: session.department,
      specialization: session.specialization,
      contactNumber: session.contactNumber,
      anesthetistName: session.anesthetistName,
      otInchargeName: session.otInchargeName,
      surgeryType: session.surgeryType,

      //-----------------------------
      // Device
      //-----------------------------
      deviceName: session.deviceName,
      deviceId: session.deviceId,

      //-----------------------------
      // Analytics
      //-----------------------------
      totalSamples: session.totalSamples,
      totalPresses: session.totalPressCount,
      averageForce: session.averageForce,
      maximumForce: session.maxForce,
      duration: Duration(seconds: session.durationSeconds),

      //-----------------------------
      // Timing
      //-----------------------------
      startTime: session.startTime,
      endTime: session.endTime,
      reportGenerated: DateTime.now(),

      //-----------------------------
      // Timeline
      //-----------------------------
      timeline: session.timelineEvents,
    );

    return _saveAndOpen(report, fileName: session.sessionId);
  }

  //=====================================================
  // SAVE + OPEN
  //=====================================================

  Future<File> _saveAndOpen(PdfReportData report, {String? fileName}) async {
    final pdf = PdfBuilder.build(report);

    final bytes = await pdf.save();

    final dir = Directory('/storage/emulated/0/Download');

    final file = File(
      '${dir.path}/${fileName ?? "SMART_Report_${DateTime.now().millisecondsSinceEpoch}"}.pdf',
    );

    await file.writeAsBytes(bytes);

    await OpenFilex.open(file.path);

    return file;
  }
}
