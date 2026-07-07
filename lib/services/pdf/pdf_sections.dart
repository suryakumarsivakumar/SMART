import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import '../../models/pdf_report_data.dart';

class PdfSections {
  // ===================================================
  // PATIENT
  // ===================================================
  static final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  static final DateFormat _dateTimeFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
  static List<pw.Widget> patient(PdfReportData data) {
    return [
      pw.Text(
        'PATIENT INFORMATION',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
      ),
      pw.SizedBox(height: 8),

      pw.Text('Patient Name : ${data.patientName}'),
      pw.Text('Patient ID : ${data.patientId}'),
      pw.Text('UHID : ${data.uhid}'),
      pw.Text('IP Number : ${data.ipNumber}'),
      pw.Text('Admission Number : ${data.admissionNumber}'),
      pw.Text('Ward : ${data.ward}'),
      pw.Text('Bed Number : ${data.bedNumber}'),
      pw.Text('Bed Type : ${data.bedType}'),
      pw.Text('Procedure : ${data.procedureName}'),
      pw.Text('DOB : ${data.dob != null ? _dateFormat.format(data.dob!) : ""}'),
      pw.Text('Age : ${data.age}'),
      pw.Text('Gender : ${data.gender}'),
      pw.Text('Mobile Number : ${data.mobileNumber}'),
      pw.Text('Hospital : ${data.hospitalName}'),
      pw.Text('Department : ${data.department}'),
      pw.Text('Diagnosis : ${data.diagnosis}'),
      pw.Text('Notes : ${data.notes}'),

      pw.Divider(),
    ];
  }

  // ===================================================
  // DOCTOR
  // ===================================================

  static List<pw.Widget> doctor(PdfReportData data) {
    return [
      pw.Text(
        'DOCTOR INFORMATION',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
      ),
      pw.SizedBox(height: 8),

      pw.Text('Doctor Name : ${data.doctorName}'),
      pw.Text('Doctor ID : ${data.doctorId}'),
      pw.Text('Hospital : ${data.doctorHospital}'),
      pw.Text('Department : ${data.doctorDepartment}'),
      pw.Text('Specialization : ${data.specialization}'),
      pw.Text('Contact Number : ${data.contactNumber}'),
      pw.Text('Anesthetist : ${data.anesthetistName}'),
      pw.Text('OT Incharge : ${data.otInchargeName}'),
      pw.Text('Surgery Type : ${data.surgeryType}'),

      pw.Divider(),
    ];
  }

  // ===================================================
  // DEVICE
  // ===================================================

  static List<pw.Widget> device(PdfReportData data) {
    return [
      pw.Text(
        'DEVICE INFORMATION',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
      ),
      pw.SizedBox(height: 8),

      pw.Text('Device Name : ${data.deviceName}'),
      pw.Text('Device ID : ${data.deviceId}'),

      pw.Divider(),
    ];
  }

  // ===================================================
  // ANALYTICS
  // ===================================================

  static List<pw.Widget> analytics(PdfReportData data) {
    return [
      pw.Text(
        'PROCEDURE ANALYTICS',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
      ),
      pw.SizedBox(height: 8),

      pw.Text('Total Samples Collected : ${data.totalSamples}'),
      pw.Text('Total Press Count : ${data.totalPresses}'),
      pw.Text('Average Force : ${data.averageForce.toStringAsFixed(1)}'),
      pw.Text('Maximum Force : ${data.maximumForce.toStringAsFixed(1)}'),
      pw.Text('Procedure Duration : ${data.duration.inSeconds} sec'),

      pw.Divider(),
    ];
  }

  // ===================================================
  // TIMING
  // ===================================================

  static List<pw.Widget> timing(PdfReportData data) {
    return [
      pw.Text(
        'PROCEDURE TIMING',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
      ),
      pw.SizedBox(height: 8),

      pw.Text(
        'Start Time : ${data.startTime != null ? _dateTimeFormat.format(data.startTime!) : ""}',
      ),
      pw.Text(
        'End Time : ${data.endTime != null ? _dateTimeFormat.format(data.endTime!) : ""}',
      ),
      pw.Text(
        'Report Generated : ${_dateTimeFormat.format(data.reportGenerated)}',
      ),

      pw.Divider(),
    ];
  }

  // ===================================================
  // TIMELINE
  // ===================================================

  static List<pw.Widget> timeline(PdfReportData data) {
    final Map<String, List<String>> grouped = {};

    String? procedureStart;
    String? procedureEnd;

    for (final line in data.timeline) {
      final parts = line.split('|');

      if (parts.length != 3) continue;

      final device = parts[0];
      final time = parts[1];
      final event = parts[2];

      if (event == "Procedure Started") {
        procedureStart = "$time    $event";
        continue;
      }

      if (event == "Procedure Completed") {
        procedureEnd = "$time    $event";
        continue;
      }

      grouped.putIfAbsent(device, () => []);

      grouped[device]!.add("$time|$event");
    }

    final widgets = <pw.Widget>[
      pw.Text(
        "PROCEDURE TIMELINE",
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
      ),

      pw.SizedBox(height: 12),
    ];

    //----------------------------------------------------
    // Procedure Started
    //----------------------------------------------------

    if (procedureStart != null) {
      widgets.add(
        pw.Text(
          procedureStart,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
      );

      widgets.add(pw.SizedBox(height: 15));
    }

    //----------------------------------------------------
    // Device Sections
    //----------------------------------------------------

    grouped.forEach((device, events) {
      widgets.add(
        pw.Text(
          "Selected Device : $device",
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13),
        ),
      );

      widgets.add(pw.SizedBox(height: 8));

      for (final item in events) {
        final p = item.split('|');

        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 4),
            child: pw.Text("${p[0]}    ${p[1]}"),
          ),
        );
      }

      widgets.add(pw.SizedBox(height: 8));

      final total = events.length;

      widgets.add(
        pw.Text(
          device.toLowerCase().contains("stapler")
              ? "Total Firings : $total"
              : "Total Samples : $total",
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
      );

      widgets.add(pw.SizedBox(height: 10));

      widgets.add(pw.Divider());

      widgets.add(pw.SizedBox(height: 10));
    });

    //----------------------------------------------------
    // Procedure Completed
    //----------------------------------------------------

    if (procedureEnd != null) {
      widgets.add(
        pw.Text(
          procedureEnd,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
      );

      widgets.add(pw.Divider());
    }

    return widgets;
  }

  // ===================================================
  // FOOTER
  // ===================================================

  static List<pw.Widget> footer() {
    return [
      pw.SizedBox(height: 15),

      pw.Center(
        child: pw.Text(
          'Generated by SMART Surgical Monitoring System',
          style: const pw.TextStyle(fontSize: 10),
        ),
      ),
    ];
  }
}
