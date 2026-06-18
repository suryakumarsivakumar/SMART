import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:open_filex/open_filex.dart';

class PdfExportService {
  Future<File?> savePdf(List<int> bytes, String suggestedName) async {
    final location = await getSaveLocation(suggestedName: suggestedName);

    if (location == null) {
      return null;
    }

    final file = File(location.path);

    await file.writeAsBytes(bytes);

    await OpenFilex.open(file.path);

    return file;
  }
}
