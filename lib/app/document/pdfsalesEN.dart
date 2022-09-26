import 'dart:io';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';


class pdfsalesEN {
  static Future<File> generate(String company, String invoiceId, String addres,
      String data, String time, String totalwithtax, String tax, list) async {
  
    final pdf = pw.Document();

    final font = await rootBundle.load("assets/fonts/Tajawal-Bold.ttf");
   
    final headers = ['#','Products', 'Quantity', 'price', ];

    final ttf = Font.ttf(font);
    pdf.addPage(
      MultiPage(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(
        base: ttf,
      ),
      pageFormat: PdfPageFormat.a4,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      build: (context) => <Widget>[
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Simplified tax invoice",
                  style: const TextStyle(
                    fontSize: 25,
                    color: PdfColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
                Text(
                  "invoice number: ${invoiceId}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: PdfColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
                Text(
                  "${company}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: PdfColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
                Text(
                  "${addres}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: PdfColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
              ]),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: PdfColors.black,
            )),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(children: [
                  Text(
                    "Date:${data} ",
                    style: const TextStyle(
                      fontSize: 20,
                      color: PdfColors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Spacer(),
                  // Container(
                  //                               height: MediaQuery.of(context)
                  //                                       .size
                  //                                       .height *
                  //                                   0.3 /
                  //                                   2,
                  //                               width: 2,
                  //                               color: Theme.of(context)
                  //                                   .primaryColor,
                  //                               margin: const EdgeInsets.only(
                  //                                   left: 10.0, right: 10.0),
                  //                             ),

                  Text(
                    "Time:${time} ",
                    style: const TextStyle(
                      fontSize: 20,
                      color: PdfColors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ]))),
        Center(
          child: Table.fromTextArray(
            headers: headers,
            data: list,

            border: TableBorder.all(color: PdfColors.black),
            headerStyle: TextStyle(
                fontWeight: FontWeight.bold,
                decorationStyle: TextDecorationStyle.double,
                font: ttf),
            // headerDecoration: BoxDecoration(border: Border.all(color: PdfColors.black)),
            cellHeight: 30,
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.center,
              2: Alignment.center,
              3: Alignment.center,
              4: Alignment.center,
              5: Alignment.center,
            },
          ),
        ),
        // SizedBox(height: 0.5 * PdfPageFormat.cm),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SizedBox(height: 0.5 * PdfPageFormat.cm),
            Text(
              "Total inclusive of VAT: ${totalwithtax}",
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 0.5 * PdfPageFormat.cm),
            Text(
              "Value added tax: ${tax}",
              style: const TextStyle(
                fontSize: 15,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 0.5 * PdfPageFormat.cm),
            Divider(),

            SizedBox(height: 2 * PdfPageFormat.mm),
            Center(
                child: Text(
              "Invoice closing: 657",
              style: const TextStyle(
                fontSize: 15,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            )),
            SizedBox(height: 0.5 * PdfPageFormat.cm),
            // Center(
            //     child: Image(
            //   MemoryImage(img2),
            //   height: 80,
            //   width: 80,
            // )),
            pw.Center(
              child: pw.BarcodeWidget(
                  data: "demo",
                  barcode: pw.Barcode.qrCode(),
                  width: 150,
                  height: 100),
            )

            // Container(height: 1, color: PdfColors.grey400),
            // SizedBox(height: 0.5 * PdfPageFormat.mm),
            // Container(height: 1, color: PdfColors.grey400),
          ],
        ),
      ],
      footer: (context) {
        final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

        return

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Divider(),
            //     SizedBox(height: 2 * PdfPageFormat.mm),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Text("4567890876543"),
            //  
            //       SizedBox(width: 2 * PdfPageFormat.mm),
            
            Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: PdfColors.black,
          ),
          textDirection: TextDirection.rtl,
        );
        //   ],
        // ),
        // SizedBox(height: 1 * PdfPageFormat.mm),
        //     Row(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       children: [
        //         Text("456789765432"),
        //         SizedBox(width: 2 * PdfPageFormat.mm),
        //         Text(
        //           "الرقم الضريبي :",
        //           textDirection: TextDirection.rtl,
        //         ),
        //       ],
        //     ),
        //   ],
        // );
      },
    ));

    return PdfApi.saveDocument(name: '${invoiceId}.pdf', pdf: pdf);
  }
}
