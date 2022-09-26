import 'dart:typed_data';
// import 'package:charset_converter/charset_converter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:e_invoice_generator/e_invoice_generator.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/modules/Activitys/controllers/activitys_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';
import '../controllers/invoice_controller.dart';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:fawry_app/app/document/pdfsalesAR.dart';
import 'package:fawry_app/app/document/pdfsalesEN.dart';
class InvoiceView extends GetView<InvoiceController> {
  @override
  final controller = Get.put(InvoiceController());
  final controllerActivity = Get.put(ActivitysController());
final translator = GoogleTranslator();
  final lang = Get.put(AppLanguageController());

  late num i = controller.totalIncludingTax - controller.totalAmount;
 

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: kwhite,
            body: GetBuilder<InvoiceController>(
          init: InvoiceController(),
          initState: (_) {},
          builder: (_) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  children: [
                  
                    Center(
                        child: Text(
                      "simplified tax invoice".tr,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color:kblack),
                    )),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
                    Center(
                        child: Text(
                      'invoice number:'.tr + controller.invoiceID.toString(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color:kblack),
                    )),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
                    Row(
                      children: [
                        controller.activityLogo.toString() == ''
                            ? Image(
                                height: 65,
                                width: 65,
                                image: AssetImage(
                                  'assets/images/logo.png',
                                ),
                                fit: BoxFit.cover,
                              )
                            : Image(
                                height: 65,
                                width: 65,
                                image: NetworkImage(
                                  'https://api.fawry-invoices.com/${controller.activityLogo.toString()}',
                                ),
                                fit: BoxFit.cover,
                              ),
                        SizedBox(
                          width: widthApp * 0.01,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.activityName.toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700,color: kblack),
                            ),
                            Text(
                              controller.address.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500,color: kblack),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date:".tr + controller.registerDate.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,color:kblack),
                        ),
                        Text(
                          "time:".tr + controller.registerTime.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,color: kblack),
                        )
                      ],
                    ),
                    SizedBox(
                      height: heightApp * 0.02,
                    ),
                    Center(
                        child: Text(
                      "VAT registration number:".tr + controller.taxNumber,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color:kblack),
                    )),
                    SizedBox(
                      height: heightApp * 0.03,
                    ),
                    DottedLine(dashColor: kgreyPrimery, dashLength: 12),
                    SizedBox(
                      height: heightApp * 0.02,
                    ),
                    DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: [
                        DataColumn(
                          label: Text(
                            'Product'.tr,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Quantity'.tr,
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text(
                            'price'.tr,
                          ),
                          numeric: true,
                        ),  DataColumn(
                                  label: Text(
                                    'Total'.tr,
                                  ),
                                  numeric: true,
                                ),
                      ],
                      rows: List.generate(
                        controller.data.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                controller.data[index]['ItemName'].toString(),
                               style: TextStyle(fontSize: 16,color:kblack),
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.data[index]['Count'].toString(),
                                 style: TextStyle(fontSize: 16,color: kblack),
                              ),
                            ), DataCell(
                              Text(
                                controller.data[index]['ItemPrice'].toString(),
                                 style: TextStyle(fontSize: 16,color: kblack),
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.data[index]['Amount'].toString(),
                                 style: TextStyle(fontSize: 16,color: kblack),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
                    DottedLine(dashColor: kgreyPrimery, dashLength: 12),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
             
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total including value added tax (SAR)".tr,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700,color:kblack),
                          ),
                          Text(
                            controller.totalIncludingTax.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700,color:kblack),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
                    DottedLine(dashColor: kgreyPrimery, dashLength: 12),
                    SizedBox(
                      height: heightApp * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Value Added Tax (SR)".tr,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700,color:kblack),
                          ),
                          Text(
                            controller.AllTotal.toStringAsFixed(2).toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700,color:kblack),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightApp * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                      EinvoiceGenerator(
                              time: controller.registerDate+ ' ' +controller.registerTime,
                        
              sellerName: controller.activityName,
              sellerTRN: "334434334345321",
              totalWithVat:   controller.totalIncludingTax,
              vatPrice: controller.AllTotal.toStringAsFixed(2)
                                            .toString(),
              size: 110,
              color: Colors.black,
            ),
             
                        InkWell(
                            onTap: () async {
                             var i = 1;
print(controller.activityName.toString());
print(controller.invoiceID.toString());
print(controller.address.toString());
print(controller.registerDate.toString());
print(controller.registerTime.toString());
print( controller.totalIncludingTax);
print(controller.AllTotal.toStringAsFixed(2)
                                            .toString());
                                            print(  controller.data.map((document) => [
                                                      document['ItemName'],
                                                      document['Count'],
                                                      document['Amount'],
                                                      // document['Total'],
                                                    ]).toList());
                                final pdfFile = lang.appLocale == 'en'
                                    ? await pdfsalesEN.generate(
                                        controller.activityName.toString(),
                                        controller.invoiceID.toString(),
                                        controller.address.toString(),
                                        controller.registerDate.toString(),
                                        controller.registerTime.toString(),
                                        controller.totalIncludingTax,
                                        controller.AllTotal.toStringAsFixed(2)
                                            .toString(),
                                       controller.data.map((document) => [
                                         
                                                     document['Amount'],
                                                      document['Count'],
                                                      document['ItemName'],   i++,
                                                      // document['Total'], 
                                                    ].reversed).toList(),
                                      )
                                    : await pdfsalesAR.generate(
                                        controller.activityName.toString(),
                                        controller.invoiceID.toString(),
                                        controller.address.toString(),
                                        controller.registerDate.toString(),
                                        controller.registerTime.toString(),
                                        controller.totalIncludingTax,
                                        controller.AllTotal.toStringAsFixed(2)
                                            .toString(),
                                     controller.data.map((document) => [
                                    i++,
                                                      document['ItemName'],
                                                      document['Count'],
                                                      document['Amount'],  
                                                      // document['Total'],
                                                    ].reversed
                                                  ).toList(),
                                      );

                                 PdfApi.shareFile(pdfFile);

                            },
                            child:Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: kwhite,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Icon(
                                      Icons.share,
                                      color: kwhite,
                                      size: 40,
                                    ),
                                  )),
                            ),
                          ),),
                        SizedBox(
                          height: heightApp * 0.044,
                          width: widthApp * 0.28,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0))),
                                          // content: Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Text(
                                          //       "Choose the language of the application you want to continue with"
                                          //           .tr),
                                          // ),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          actionsPadding:
                                              const EdgeInsets.all( 25),
                                          actions: <Widget>[
                                            // GetBuilder<ShowInvoicesController>(
                                            //     init: ShowInvoicesController(),
                                            //     initState: (_) {},
                                            //     builder: (_) {
                                            //       return 
                                                  
                                                  
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [


                                                      Flexible(
                                                        child: 
                                                      InkWell(
                                                          onTap: ()async {
                                                              var translationActivityName = await   translator.translate(controller.activityName, from: 'ar', to: 'en');
                                                          var translationAdress = await   translator.translate(controller.address, from: 'ar', to: 'en');

                                    //                       Navigator.push(
                                    //                         context,
                                    //                         MaterialPageRoute(
                                    //                             builder:
                                    //                                 (context) =>
                                    //                                     PrintScreen(
                                                                         
                                    //                                     translationActivityName.toString(),
                                    //                                      translationAdress.toString(),
                                    //                                       controller.data
                                    //                                ,   controller.invoiceID
                                    //                             .toString(),
                                    //                                       controller.totalIncludingTax,
                                                                              
                                    //                                       controller
                                    //                                           .registerDate,
                                    //                                       controller
                                    //                                           .registerTime,  controller.activityLogo.toString() == ''
                                    // ? 'assets/images/logo.png' 
                                    // :
                                    //       'https://api.fawry-invoices.com/${controller.activityLogo.toString()}',
                                       
                                    //                                     )),
                                    //                       );
                                                          },
                                                          child: Container(
                                                            height: 120,
                                                            width: 120,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border: Border.all(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColorDark),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          59,
                                                                          59,
                                                                          152,
                                                                          0.2),
                                                                  blurRadius:
                                                                      30,
                                                                  offset:
                                                                      Offset(
                                                                          0, 4),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Icon(Icons.print_rounded,color: Colors.black,size: 70,)
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    "printing".tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Theme.of(context)
                                                                            .primaryColor),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ))),
                                                      SizedBox(
                                                        width: widthApp * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () async{
                                                         var i = 1;
                             
//                                  String text = 'hjhjhjjhjh';
// Directory? directory = Platform.isAndroid
//         ? await getExternalStorageDirectory() //FOR ANDROID
//         : await getApplicationSupportDirectory();
// final path = '${directory!.path}/text.pdf';
//   await   File(path).writeAsString(text);print(path);

// await Share.shareFiles([path]);

                                final pdfFile = lang.appLocale == 'en'
                                    ? await pdfsalesEN.generate(
                                        controller.activityName.toString(),
                                        controller.invoiceID.toString(),
                                        controller.address.toString(),
                                        controller.registerDate.toString(),
                                        controller.registerTime.toString(),
                                        controller.totalIncludingTax,
                                        controller.AllTotal.toStringAsFixed(2)
                                            .toString(),
                                       controller.data.map((document) => [
                                         
                                                     document['Amount'],
                                                      document['Count'],
                                                      document['ItemName'],   i++,
                                                      // document['Total'], 
                                                    ].reversed).toList(),
                                      )
                                    : await pdfsalesAR.generate(
                                        controller.activityName.toString(),
                                        controller.invoiceID.toString(),
                                        controller.address.toString(),
                                        controller.registerDate.toString(),
                                        controller.registerTime.toString(),
                                        controller.totalIncludingTax,
                                        controller.AllTotal.toStringAsFixed(2)
                                            .toString(),
                                     controller.data.map((document) => [
                                   
                                                     i++,
                                                      document['ItemName'],
                                                      document['Count'],
                                                      document['Amount'],  
                                                      // document['Total'],
                                                    ].reversed).toList(),
                                      );

                                PdfApi.openFile(pdfFile);
                                Navigator.pop(
                                                                context);
                                                        },
                                                        child: Container(
                                                          height: 120,
                                                          width: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColorDark),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        59,
                                                                        59,
                                                                        152,
                                                                        0.2),
                                                                blurRadius: 30,
                                                                offset: Offset(
                                                                    0, 4),
                                                              ),
                                                            ],
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Icon(Icons.picture_as_pdf_rounded,color: Colors.red,size: 70,)
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  "Pdf".tr,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                  )
                                                // })
                                          ],
                                        );
                                      });
                                  // }
                                  // screenshotController
                                  //                   .capture(delay: Duration(milliseconds: 10))
                                  //                   .then((capturedImage) async {
                                  //               // _saved(capturedImage!);
                                  //               print(capturedImage);
                                  // final bytes = (capturedImage!);

                                  // copy from decodeImageFromList of package:flutter/painting.dart
                                  // final codec = await instantiateImageCodec(bytes);
                                  // final frameInfo = await codec.getNextFrame();
                                  // print(capturedImage);
                                  // print(bytes);
                                  //  final Uint8List imageBytes = data.buffer.asUint8List();
                                  //   final image = decodeImage(imageBytes);

                                  //                                      Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => PrintScreen(capturedImage)),
                                  // );
                                  // showing the captured widget
                                  // through ShowCapturedWidget
                                  // ShowCapturedWidget(context,
                                  //                    capturedImage!);
                                  //  print(capturedImage.buffer.asUint8List());
                                  // }).catchError((onError) {
                                  //   print(onError);
                                  // });
                                  //                         Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => PrintScreen()),
                                  // );
                          //     showDialog(
                          // context: context,
                          // builder: (BuildContext context) {
                          //   return AlertDialog(
                          //     scrollable: true,
                          //     shape: const RoundedRectangleBorder(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(12.0))),
                          //     content: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text(
                          //           "Choose the language of the application you want to continue with"
                          //               .tr),
                          //     ),
                          //     actionsAlignment: MainAxisAlignment.center,
                          //     actionsPadding: const EdgeInsets.only(bottom: 25),
                          //     actions: <Widget>[
                          //       GetBuilder<InvoiceController>(
                          //           init: InvoiceController(),
                          //           initState: (_) {},
                          //           builder: (_) {
                          //             return Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 InkWell(
                          //                     onTap: () {
                          //                                                                         Navigator.pop(context);

                          //                     },
                          //                     child: Container(
                          //                       height: 120,
                          //                       width: 120,
                          //                       decoration: BoxDecoration(
                          //                         color: Colors.white,
                          //                         borderRadius:
                          //                             BorderRadius.circular(12),
                          //                         border: Border.all(
                          //                             color:
                          //                              Theme.of(context)
                          //                                     .primaryColorDark
                          //                                ),
                          //                         boxShadow: const [
                          //                           BoxShadow(
                          //                             color: Color.fromRGBO(
                          //                                 59, 59, 152, 0.2),
                          //                             blurRadius: 30,
                          //                             offset: Offset(0, 4),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       child: Column(
                          //                         children: [
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     8.0),
                          //                             child: ClipRRect(
                          //                                 borderRadius:
                          //                                     BorderRadius
                          //                                         .circular(12),
                          //                                 child: Image.asset(
                          //                                     "assets/images/Flag_of_Saudi_Arabia.png")),
                          //                           ),
                          //                           Center(
                          //                             child: Text(
                          //                               "العربية",
                          //                               style: TextStyle(
                          //                                   fontWeight:
                          //                                       FontWeight.bold,
                          //                                   color: Theme.of(
                          //                                           context)
                          //                                       .primaryColor),
                          //                             ),
                          //                           )
                          //                         ],
                          //                       ),
                          //                     )),
                          //                 SizedBox(
                          //                   width: widthApp * 0.03,
                          //                 ),
                          //                 InkWell(
                          //                   onTap: () {
                          //                                                                       Navigator.pop(context);

                          //                   },
                          //                   child: Container(
                          //                     height: 120,
                          //                     width: 120,
                          //                     decoration: BoxDecoration(
                          //                       color: Colors.white,
                          //                       borderRadius:
                          //                           BorderRadius.circular(12),
                          //                       border: Border.all(
                          //                           color: Theme.of(context)
                          //                                   .primaryColorDark),
                          //                       boxShadow: const [
                          //                         BoxShadow(
                          //                           color: Color.fromRGBO(
                          //                               59, 59, 152, 0.2),
                          //                           blurRadius: 30,
                          //                           offset: Offset(0, 4),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                     child: Column(
                          //                       children: [
                          //                         Padding(
                          //                           padding:
                          //                               const EdgeInsets.all(
                          //                                   8.0),
                          //                           child: ClipRRect(
                          //                               borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(12),
                          //                               child: Image.asset(
                          //                                 "assets/images/Flag_of_Great_Britain.jpg",
                          //                               )),
                          //                         ),
                          //                         Center(
                          //                           child: Text(
                          //                             "English",
                          //                             style: TextStyle(
                          //                                 fontWeight:
                          //                                     FontWeight.bold,
                          //                                 color: Theme.of(
                          //                                         context)
                          //                                     .primaryColor),
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             );
                          //           })
                          //     ],
                          //   );
                          // });
                          //   },
                            //
                            },
                            child: Center(
                              child: Text(
                                "Show".tr,
                               
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightApp * 0.02,
                    ),
                    MainButton(
                        text: "To return to the home page".tr,
                          press: ()async {
                        await      controllerActivity.fetchMYActivity();
                            Get.offAndToNamed(Routes.BASIC);

                            }),
                        SizedBox(
                      height: heightApp * 0.02,
                    ),
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
