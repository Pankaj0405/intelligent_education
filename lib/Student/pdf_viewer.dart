import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Represents Homepage for Navigation
class PdfPage extends StatefulWidget {
  @override
  _PdfPage createState() => _PdfPage();
}

class _PdfPage extends State<PdfPage> {
  @override
  void initState() {
    loadNetwork();
    super.initState();
  }

  late File Pfile;
  bool isLoading = false;

  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });
    var url = 'https://firebasestorage.googleapis.com/v0/b/councellingapp-10dca.appspot.com/o/Documents%2Finstruction.pdf?alt=media&token=a531f678-3970-4751-98d1-b9e1f0aef81f.pdf';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });
    print(Pfile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        child: Center(
          child: PDFView(
            filePath: Pfile.path,
          ),
        ),
      ),
    );
  }
}
