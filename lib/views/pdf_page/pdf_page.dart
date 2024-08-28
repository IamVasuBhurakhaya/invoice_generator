import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/globals.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPDF() {
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Container(
                  alignment: pw.Alignment.topCenter,
                  height: 100,
                  width: 600,
                  color: PdfColor.fromInt(0xff957fef),
                ),
              ],
            ),
            // ...Globals.allCompanyDetail.map(
            //   (e) => pw.Row(
            //     children: [],
            //   ),
            // ),
          ],
        ),
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: PdfPreview(
        build: (format) => getPDF(),
      ),
    );
  }
}
