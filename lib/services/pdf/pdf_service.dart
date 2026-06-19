import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../providers/session_provider.dart';
import '../../models/session_model.dart';

class PdfService {
  // ===================================================
  // LIVE PROCEDURE PDF
  // ===================================================

  Future<File> generateReport({
    required SessionData session,
    required int totalPresses,
    required int totalSamples,
    required double averageForce,
    required double maximumForce,
    required Duration duration,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text('SMART Report')),

          pw.SizedBox(height: 20),

          pw.Text('Surgical Monitoring and Analytics for Real-Time Tracking'),

          pw.Divider(),

          pw.Text(
            'PATIENT INFORMATION',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text('Patient Name: ${session.patient?.patientName ?? ""}'),
          pw.Text('Patient ID: ${session.patient?.patientId ?? ""}'),
          pw.Text('UHID: ${session.patient?.uhid ?? ""}'),
          pw.Text('IP Number: ${session.patient?.ipNumber ?? ""}'),
          pw.Text(
            'Admission Number: ${session.patient?.admissionNumber ?? ""}',
          ),
          pw.Text('Ward: ${session.patient?.ward ?? ""}'),
          pw.Text('Bed Number: ${session.patient?.bedNumber ?? ""}'),
          pw.Text('Bed Type: ${session.patient?.bedType ?? ""}'),
          pw.Text('Procedure Name: ${session.patient?.procedureName ?? ""}'),
          pw.Text('Age: ${session.patient?.age ?? ""}'),
          pw.Text('DOB: ${session.patient?.dob ?? ""}'),
          pw.Text('Gender: ${session.patient?.gender ?? ""}'),
          pw.Text('Mobile Number: ${session.patient?.mobileNumber ?? ""}'),
          pw.Text('Hospital Name: ${session.patient?.hospitalName ?? ""}'),
          pw.Text('Department: ${session.patient?.department ?? ""}'),
          pw.Text('Diagnosis: ${session.patient?.diagnosis ?? ""}'),
          pw.Text('Notes: ${session.patient?.notes ?? ""}'),

          pw.SizedBox(height: 20),

          pw.Text(
            'DOCTOR INFORMATION',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text('Doctor Name: ${session.doctor?.doctorName ?? ""}'),
          pw.Text('Doctor ID: ${session.doctor?.doctorId ?? ""}'),
          pw.Text('Hospital: ${session.doctor?.hospital ?? ""}'),
          pw.Text('Department: ${session.doctor?.department ?? ""}'),
          pw.Text('Specialization: ${session.doctor?.specialization ?? ""}'),
          pw.Text('Contact Number: ${session.doctor?.contactNumber ?? ""}'),
          pw.Text('Anesthetist: ${session.doctor?.anesthetistName ?? ""}'),
          pw.Text('OT Incharge: ${session.doctor?.otInchargeName ?? ""}'),
          pw.Text('Surgery Type: ${session.doctor?.surgeryType ?? ""}'),

          pw.SizedBox(height: 20),

          pw.Text(
            'DEVICE',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text(session.deviceName ?? ''),

          pw.SizedBox(height: 20),

          pw.Text(
            'BIOPSY PROCEDURE ANALYTICS',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Text('Total Samples Collected: $totalSamples'),
          pw.Text('Total Presses: $totalPresses'),
          pw.Text('Average Force: ${averageForce.toStringAsFixed(1)}'),
          pw.Text('Maximum Force: ${maximumForce.toStringAsFixed(1)}'),
          pw.Text('Duration: ${duration.inSeconds} sec'),
          pw.Text('Report Generated: ${DateTime.now()}'),
        ],
      ),
    );

    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();

    final file = File(
      '${dir.path}/SMART_Report_${DateTime.now().millisecondsSinceEpoch}.pdf',
    );

    await file.writeAsBytes(bytes);

    await OpenFilex.open(file.path);

    return file;
  }

  // ===================================================
  // HISTORY PROCEDURE PDF
  // ===================================================

  Future<File> generateSessionReport(SessionModel session) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text('SMART Procedure Report')),

          pw.SizedBox(height: 20),

          pw.Text(
            'PATIENT INFORMATION',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text('Patient Name: ${session.patientName}'),

          pw.Text('Patient ID: ${session.patientId}'),
          pw.Text('Patient Name: ${session.patientName}'),
          pw.Text('Patient ID: ${session.patientId}'),
          pw.Text('UHID: ${session.uhid}'),
          pw.Text('IP Number: ${session.ipNumber}'),
          pw.Text('Admission Number: ${session.admissionNumber}'),
          pw.Text('DOB: ${session.dob}'),
          pw.Text('Age: ${session.age}'),
          pw.Text('Gender: ${session.gender}'),
          pw.Text('Ward: ${session.ward}'),
          pw.Text('Bed Number: ${session.bedNumber}'),
          pw.Text('Bed Type: ${session.bedType}'),
          pw.Text('Procedure Name: ${session.procedureName}'),
          pw.Text('Hospital Name: ${session.hospitalName}'),
          pw.Text('Department: ${session.department}'),
          pw.Text('Diagnosis: ${session.diagnosis}'),
          pw.Text('Notes: ${session.notes}'),
          pw.SizedBox(height: 10),

          pw.Text(
            'DOCTOR INFORMATION',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text('Doctor Name: ${session.doctorName}'),

          pw.Text('Doctor ID: ${session.doctorId}'),
          pw.Text('Doctor Name: ${session.doctorName}'),
          pw.Text('Doctor ID: ${session.doctorId}'),
          pw.Text('Hospital: ${session.doctorHospital}'),
          pw.Text('Specialization: ${session.specialization}'),
          pw.Text('Contact Number: ${session.contactNumber}'),
          pw.Text('Anesthetist: ${session.anesthetistName}'),
          pw.Text('OT Incharge: ${session.otInchargeName}'),
          pw.Text('Surgery Type: ${session.surgeryType}'),
          pw.SizedBox(height: 10),

          pw.Text(
            'DEVICE INFORMATION',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text('Device Name: ${session.deviceName}'),

          pw.Text('Device ID: ${session.deviceId}'),
          pw.Text('Total Samples Collected: ${session.totalPressCount}'),
          pw.Text('Press Count: ${session.totalPressCount}'),
          pw.Text('Average Force: ${session.averageForce.toStringAsFixed(1)}'),
          pw.Text('Maximum Force: ${session.maxForce.toStringAsFixed(1)}'),
          pw.Text('Duration: ${session.durationSeconds}s'),
          pw.Divider(),

          pw.Text(
            'PROCEDURE ANALYTICS',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.Text('Press Count: ${session.totalPressCount}'),

          pw.Text('Average Force: ${session.averageForce.toStringAsFixed(1)}'),

          pw.Text('Maximum Force: ${session.maxForce.toStringAsFixed(1)}'),

          pw.Text('Duration: ${session.durationSeconds}s'),

          pw.SizedBox(height: 10),

          pw.Text('Start Time: ${session.startTime}'),

          pw.Text('End Time: ${session.endTime}'),

          pw.SizedBox(height: 20),

          pw.Text('Generated by SMART Surgical Monitoring System'),
        ],
      ),
    );

    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/${session.sessionId}.pdf');

    await file.writeAsBytes(bytes);

    await OpenFilex.open(file.path);

    return file;
  }
}
