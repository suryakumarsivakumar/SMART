import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../models/pdf_report_data.dart';
import 'pdf_sections.dart';

class PdfBuilder {
  static pw.Document build(PdfReportData data) {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,

        build: (context) => [
          //--------------------------------------------------
          // HEADER
          //--------------------------------------------------
          pw.Header(
            level: 0,
            child: pw.Text(
              'SMART SURGICAL MONITORING REPORT',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 22),
            ),
          ),

          pw.Text('Surgical Monitoring and Analytics for Real-Time Tracking'),

          pw.SizedBox(height: 20),

          //--------------------------------------------------
          // PATIENT
          //--------------------------------------------------
          ...PdfSections.patient(data),

          //--------------------------------------------------
          // DOCTOR
          //--------------------------------------------------
          ...PdfSections.doctor(data),

          //--------------------------------------------------
          // DEVICE
          //--------------------------------------------------
          ...PdfSections.device(data),

          //--------------------------------------------------
          // ANALYTICS
          //--------------------------------------------------
          ...PdfSections.analytics(data),

          //--------------------------------------------------
          // TIMING
          //--------------------------------------------------
          ...PdfSections.timing(data),

          //--------------------------------------------------
          // TIMELINE
          //--------------------------------------------------
          ...PdfSections.timeline(data),

          //--------------------------------------------------
          // FOOTER
          //--------------------------------------------------
          ...PdfSections.footer(),
        ],
      ),
    );

    return pdf;
  }
}
