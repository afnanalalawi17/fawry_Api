import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:share_plus/share_plus.dart';

class PdfApi {


  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    print(file);
    await file.writeAsBytes(bytes);

    return file;
  }

  static Future shareFile(File file) async {
    final url = file.path;
    final dir = await getApplicationDocumentsDirectory();

    await Share.shareFiles([url]);
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
