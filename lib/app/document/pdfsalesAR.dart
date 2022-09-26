import 'dart:io';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class User {
  final String number;

  final String item;
  final String total;

  final int count;

  const User({
    required this.number,
    required this.item,
    required this.count,
    required this.total,
  });
}

class pdfsalesAR {
  static Future<File> generate(String company, String invoiceId, String addres,
      String data, String time, String totalwithtax, String tax, list) async {
    // print([list].map((e) {
    //   [e.itemName as String, e.count as int, e.amount as int];
    // }).toList());
    final pdf = pw.Document();

    final font = await rootBundle.load("assets/fonts/Tajawal-Bold.ttf");
    final img =
        (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List();
    final img2 =
        (await rootBundle.load('assets/images/qr.png')).buffer.asUint8List();
    final headers = ['السعر', 'الكمية', 'المنتجات', '#'];
    final headersDate = ['3455:الوقت', 'التاريخ:883737'];
    final users = [
      const User(item: "منتج ١", count: 454, total: "23", number: '1'),
      const User(item: "منتج ١", count: 454, total: "33", number: '2'),
      const User(item: "منتج ١", count: 929, total: "45", number: '3'),
      const User(item: "منتج ١", count: 282, total: "42", number: '4'),
      const User(item: "منتج ١", count: 343, total: "53", number: '5'),
      const User(item: "منتج ١", count: 554, total: "58", number: '6'),
      const User(item: "منتج ١", count: 454, total: "93", number: '7'),
    ];

    // final data = [param7][0]
    //     .map((user) => [user.itemName, user.count, user.amount, user.invoiceID])
    //     .toList();
    // print(data);

    // final usersData = data[0];
    // final dataData = users
    //     .map((user) => [
    //           user.count,
    //           user.total,
    //           user.item,
    //         ])
    //     .toList();
    final ttf = Font.ttf(font);
    pdf.addPage(MultiPage(
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
                  "فاتورة ضريبية مبسطة",
                  style: const TextStyle(
                    fontSize: 25,
                    color: PdfColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
                Text(
                  "رقم الفاتورة: ${invoiceId}",
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
                    "التاريخ:${data} ",
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
                    "الوقت:${time} ",
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
              0: Alignment.centerRight,
              1: Alignment.centerRight,
              2: Alignment.centerRight,
              3: Alignment.centerRight,
              4: Alignment.centerRight,
              5: Alignment.centerRight,
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
              "المجموع شامل ضريبة القيمة المضافة: ${totalwithtax}",
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 0.5 * PdfPageFormat.cm),
            Text(
              "ضريبة القيمة المضافة: ${tax}",
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
              "اغلاق الفاتورة: 657",
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
            //         SizedBox(width: 2 * PdfPageFormat.mm),
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
