import 'dart:io';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

 class PdfPurchase {

 
  static Future<File> generate(String company , String supplier,
  String address,String registerDate,String discount,String itemHistoryID, total, totalWithTax, List<dynamic> datalist ) async {
    final pdf = pw.Document();
print(company);
print(supplier);
print(address);
print(registerDate);
print(itemHistoryID);
    final font = await rootBundle.load("assets/fonts/Tajawal-Bold.ttf");
    final img =
        (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List();
            final img2 =
        (await rootBundle.load('assets/images/qr.png')).buffer.asUint8List();
    final headers = ['Item', 'Count','Price','Total', 'Discount' ];

  

    final ttf = Font.ttf(font);
    pdf.addPage(MultiPage(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(
        base: ttf,
        
      ),pageFormat :PdfPageFormat.a4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      build: (context) => <Widget>[
    Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image(
              MemoryImage(img2),
              height: 80,
              width: 80,
            ),
          
        Row(   mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
children: [
 Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 20,
                      color: PdfColors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 20,
                      color: PdfColors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ]),
            SizedBox(width: 0.5 * PdfPageFormat.cm),
            Image(
              MemoryImage(img),
              height: 80,
              width: 80,
            ),
]
            )
           
          ],
        )),
        Header(
          child: Center(
            child: Text('فاتورة ضريبية Tax Invoices',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: PdfColors.black,
                    font: ttf),
                textAlign: TextAlign.center),
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(border: Border.all(
            color: PdfColors.black,
            width: 2
          )),
        ),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Supplier Name',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
          Text(supplier,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.deepOrangeAccent200,
                  font: ttf),
              textAlign: TextAlign.center),
          Text('اسم المورد',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
        ]), SizedBox(height: 0.2 * PdfPageFormat.cm),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Invoices Number',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
          Text(itemHistoryID,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.deepOrangeAccent200,
                  font: ttf),
              textAlign: TextAlign.center),
          Text('رقم الفاتورة',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
        ]),
        SizedBox(height: 0.2 * PdfPageFormat.cm),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Invoices Date',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
          Text(registerDate,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.deepOrangeAccent200,
                  font: ttf),
              textAlign: TextAlign.center),
          Text('تاريخ الفاتورة',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
        ]), SizedBox(height: 0.2 * PdfPageFormat.cm),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Invoices Time',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
          Text(registerDate,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.deepOrangeAccent200,
                  font: ttf),
              textAlign: TextAlign.center),
          Text('وقت الفاتورة',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  font: ttf),
              textAlign: TextAlign.center),
        ]), SizedBox(height: 0.2 * PdfPageFormat.cm),
        // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //   Text('VAT  number',
        //       style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: PdfColors.black,
        //           font: ttf),
        //       textAlign: TextAlign.center),
        //   Text(taxValue,
        //       style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: PdfColors.deepOrangeAccent200,
        //           font: ttf),
        //       textAlign: TextAlign.center),
        //   Text('رقم الضريبة المضافة ',
        //       style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: PdfColors.black,
        //           font: ttf),
        //       textAlign: TextAlign.center),
        // ]),
        Center(
          child: Table.fromTextArray(
            headers: headers,
            data: datalist,

      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.deepOrangeAccent200),
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
      Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SizedBox(height: 0.5 * PdfPageFormat.cm),
            Row(
              children: [

                  Text(
              "Total inclusive of VAT: ",
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),
                  Text(
              total.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),
               ]
            ),
          
            SizedBox(height: 0.2 * PdfPageFormat.cm),


Row(
  children: [
        Text(
               "Discount:",
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),


            Text(
              discount,
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),  ]
),         SizedBox(height: 0.2 * PdfPageFormat.cm),
Row(
  children: [
        Text(
               "Value added tax:",
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),


            Text(
              totalWithTax.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: PdfColors.black,
              ),
              textDirection: TextDirection.rtl,
            ),  ]
),
            SizedBox(height: 0.5 * PdfPageFormat.cm),
            Divider(),
              ],
            ),
         
    //  SizedBox(height: 2 * PdfPageFormat.mm),Divider(),
   
    ],
      footer: (context) {
        final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

        return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ Text(""),  SizedBox(width: 2 * PdfPageFormat.mm),
        Text("السجل التجاري :", textDirection: TextDirection.rtl,),
      
       
      ],
    ),
          SizedBox(height: 1 * PdfPageFormat.mm),
            Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [ Text(""),  SizedBox(width: 2 * PdfPageFormat.mm),
        Text("الرقم الضريبي :", textDirection: TextDirection.rtl,),
      
       
      ],
    ),
        ],
      );
      },
    )
   ); 

    return PdfApi.saveDocument(name: 'my_example.pdf', pdf: pdf);
  }


}

