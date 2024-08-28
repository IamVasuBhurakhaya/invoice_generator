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
  Future<Uint8List> getPDF()
  {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header Section
            pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              decoration: pw.BoxDecoration(
                color:
                    PdfColor.fromInt(0xffb79ced), // Background color for header
                borderRadius: pw.BorderRadius.only(
                  bottomLeft: pw.Radius.circular(15),
                  bottomRight: pw.Radius.circular(15),
                ),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "${Globals.company_name}",
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white, // Text color
                    ),
                  ),
                  pw.Text(
                    "${Globals.company_contact}",
                    style: pw.TextStyle(
                      fontSize: 18,
                      color: PdfColors.white, // Text color
                    ),
                  ),
                  pw.Text(
                    "${Globals.company_address}",
                    style: pw.TextStyle(
                      fontSize: 18,
                      color: PdfColors.white, // Text color
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              "Invoice for: ${Globals.customer_name}",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blueGrey, // Text color
              ),
            ),
            pw.SizedBox(height: 10),
            // Table Section
            pw.TableHelper.fromTextArray(
              headers: ['Product Name', 'Price', 'Quantity', 'Total'],
              data: Globals.allProductDetail.map((e) {
                final price = double.tryParse(e['product_price'] ?? '') ?? 0;
                final quantity = int.tryParse(e['product_qty'] ?? '') ?? 0;
                final total = price * quantity;
                Globals.totalbill = (Globals.totalbill ?? 0) + total;
                return [
                  e['product_name'] ?? '',
                  price.toStringAsFixed(2),
                  quantity.toString(),
                  total.toStringAsFixed(2),
                ];
              }).toList(),
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.white, // Header text color
              ),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xffb79ced), // Header background color
              ),
              cellAlignment: pw.Alignment.centerLeft,
              border: pw.TableBorder.all(color: PdfColors.grey300),
              cellPadding:
                  const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              rowDecoration: pw.BoxDecoration(
                color: PdfColors.grey100,
              ),
            ),
            pw.SizedBox(height: 20),
            // Footer Section
            pw.Container(
              alignment: pw.Alignment.centerRight,
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: pw.BoxDecoration(
                color:
                    PdfColor.fromInt(0xffb79ced), // Background color for footer
                borderRadius: pw.BorderRadius.only(
                  topLeft: pw.Radius.circular(10),
                  topRight: pw.Radius.circular(10),
                ),
              ),
              child: pw.Text(
                'Total Bill: ${Globals.totalbill?.toStringAsFixed(2) ?? '0.00'}',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.white, // Text color
                ),
              ),
            ),
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
