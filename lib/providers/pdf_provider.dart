import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/pdf/pdf_service.dart';

final pdfProvider = Provider<PdfService>((ref) => PdfService());
