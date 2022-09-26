// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'dart:ui';
// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:fawry_app/Shared/color/colors.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
// import 'package:get/get.dart';
// import 'package:image/image.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:translator/translator.dart';

// class PrintScreen extends StatefulWidget {
//   final compay;
//   final String? address;
//   final List<dynamic> list;
//   final invoiceID;
//   final String? totalinvoice;
//   final registerDate;
//   final registerTime;
//   final image;

//   PrintScreen(this.compay, this.address, this.list, this.invoiceID,
//       this.totalinvoice, this.registerDate, this.registerTime, this.image);

//   @override
//   State<PrintScreen> createState() => _PrintScreenState();
// }

// class _PrintScreenState extends State<PrintScreen> {
//   final PrinterBluetoothManager printerManager = PrinterBluetoothManager();
//   List<PrinterBluetooth> _devices = [];
//   String? _devicesMsg;
//   BluetoothManager bluetoothManager = BluetoothManager.instance;
//   var name;
//   var count;
//   var total;
// final translator = GoogleTranslator();
//   @override
//   void initState() {
//     bluetoothManager.state.listen((val) {
//       if (!mounted) return;
//       if (val == 12) {
//         print('on');
//         initPrinter();
//       } else if (val == 10) {
//         print('off');
//         setState(() {
//           _devicesMsg = 'bluetooth is not enabled'.tr;
//         });
//       }
//       print('state is $val');
//     });

//     super.initState();
//   }

//   void _startScanDevices() {
//     setState(() {
//       _devices = [];
//     });
//     printerManager.startScan(Duration(seconds: 4));
//   }

//   void _stopScanDevices() {
//     printerManager.stopScan();
//   }

//   @override
//   void dispose() {
//     printerManager.startScan(const Duration(seconds: 2));
//     super.dispose();
//   }

//   void initPrinter() {
//     printerManager.startScan(const Duration(seconds: 2));

//     printerManager.scanResults.listen((val) async {
//       print('-------------');
//       if (!mounted) return;
//       setState(() => _devices = val);
//       print(_devices);
//       print(_devices.length);
//       if (_devices.isEmpty) {
//         setState(() => _devicesMsg = 'No devices'.tr);
//       }
//       print('-------------');
//     });
//   }

//   Future<void> _startPrint(PrinterBluetooth printer) async {
//     printerManager.selectPrinter(printer);
//     final profile = await CapabilityProfile.load();

//     final result = await printerManager
//         .printTicket(await demoReceipt(PaperSize.mm80, profile));
//     print(result);
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         content: Text(result.msg),
//       ),
//     );
//   }

//   Future<List<int>> demoReceipt(
//       PaperSize paper, CapabilityProfile profile) async {
//     final Generator ticket = Generator(paper, profile);
//     List<int> bytes = [];

//     // Print image

//     bytes += ticket.text(
//       'Simplified tax invoice',
//       styles: PosStyles(
//           align: PosAlign.center,
//           height: PosTextSize.size1,
//           width: PosTextSize.size1,
//           bold: true),
//     );
//     //        final ByteData data = await rootBundle.load(widget.image.toString());
//     // final Uint8List imageBytes = data.buffer.asUint8List();
//     // final image = decodeImage(imageBytes);
//     // bytes += ticket.image(image!);
//     bytes += ticket.text('invoice number:' + widget.invoiceID.toString(),
//         styles: PosStyles(
//             align: PosAlign.center,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//             bold: true),
//         linesAfter: 1);
//     bytes += ticket.row([
//       PosColumn(
//           text: "Company: " + widget.compay.toString(),
//           styles: PosStyles(
//               // align: PosAlign.center,
//               // height: PosTextSize.size1,
//               // width: PosTextSize.size2,
//               ),
//           width: 7),
//       PosColumn(
//           text: "Date: " + widget.registerDate.toString(),
//           styles: PosStyles(
//             align: PosAlign.right,
//             // height: PosTextSize.size1,
//             // width: PosTextSize.size2,
//           ),
//           width: 5),
//     ]);
//     bytes += ticket.row([
//       PosColumn(
//           text: "Addres: " + widget.address.toString(),
//           styles: PosStyles(
//               // align: PosAlign.center,
//               // height: PosTextSize.size1,
//               // width: PosTextSize.size2,
//               ),
//           width: 6),
//       PosColumn(
//           text: "Time: " + widget.registerTime.toString(),
//           styles: PosStyles(
//             align: PosAlign.right,
//             // height: PosTextSize.size1,
//             // width: PosTextSize.size2,
//           ),
//           width: 6),
//     ]);
//     // bytes += ticket.text(widget.compay.toString(),
//     //     styles: PosStyles(
//     //       align: PosAlign.center,
//     //       height: PosTextSize.size2,
//     //       width: PosTextSize.size2,
//     //     ),
//     //     linesAfter: 1);

//     // bytes += ticket.text(widget.address.toString(),
//     //     styles: PosStyles(align: PosAlign.center));
//     // // bytes += ticket.text('New Braunfels, TX',
//     // //     styles: PosStyles(align: PosAlign.center));
//     // bytes += ticket.text('PHONE',
//     //     styles: PosStyles(align: PosAlign.center));
//     // bytes += ticket.text('Web: www.example.com',
//     //     styles: PosStyles(align: PosAlign.center), linesAfter: 1);

//     bytes += ticket.hr();
//     bytes += ticket.row([
//       PosColumn(text: 'Item', width: 5),
//       PosColumn(text: 'Qty', width: 3),
//       PosColumn(
//           text: 'Price', width: 2, styles: PosStyles(align: PosAlign.right)),
//       PosColumn(
//           text: 'Total', width: 2, styles: PosStyles(align: PosAlign.right)),
//     ]);
//     for (var i = 0; i < widget.list.length; i++) {
//       count = widget.list.map((i) => i.count).toList();
//       name = widget.list.map((i) => i.itemName).toList();
//       total = widget.list.map((i) => i.amount).toList();
//       var translationActivityName = await translator
//           .translate(name[i], from: 'ar', to: 'en');

//       bytes += ticket.row([
//         PosColumn(text: translationActivityName.toString(), width: 5),
//         PosColumn(text: count[i].toString(), width: 3),
//         PosColumn(
//             text: '456',
//             width: 2,
//             styles: PosStyles(align: PosAlign.right)),
//         PosColumn(
//             text: total[i].toString(),
//             width: 2,
//             styles: PosStyles(align: PosAlign.right)),
//       ]);
//     }

//     bytes += ticket.hr();

//     bytes += ticket.row([
//       PosColumn(
//           text: 'Total',
//           width: 5,
//           styles: PosStyles(
//               // height: PosTextSize.size2,
//               // width: PosTextSize.size2,
//               )),
//       PosColumn(
//           text: widget.totalinvoice.toString(),
//           width: 7,
//           styles: PosStyles(
//             align: PosAlign.right,
//             // height: PosTextSize.size2,
//             // width: PosTextSize.size2,
//           )),
//     ]);

//     bytes += ticket.hr(ch: '=', linesAfter: 1);

//     // bytes += ticket.row([
//     //   PosColumn(
//     //       text: 'Cash',
//     //       width: 7,
//     //       styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
//     //   PosColumn(
//     //       text: '\$15.00',
//     //       width: 5,
//     //       styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
//     // ]);
//     // bytes += ticket.row([
//     //   PosColumn(
//     //       text: 'Change',
//     //       width: 7,
//     //       styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
//     //   PosColumn(
//     //       text: '\$4.03',
//     //       width: 5,
//     //       styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
//     // ]);

//     bytes += ticket.feed(2);
//     bytes += ticket.text('Thank you!',
//         styles: PosStyles(
//           align: PosAlign.center,
//           bold: true,
//         ),
//      );
// // bytes += ticket.feed(2);
//     // final now = DateTime.now();
//     // final formatter = DateFormat('MM/dd/yyyy H:m');
//     // final String timestamp = formatter.format(now);
//     // bytes += ticket.text(widget.registerDate+' '+ widget.registerTime,
//     //     styles: PosStyles(align: PosAlign.center), linesAfter: 2);

//     // Print QR Code from image
//     // try {
//     //   const String qrData = 'example.com';
//     //   const double qrSize = 200;
//     //   final uiImg = await QrPainter(
//     //     data: qrData,
//     //     version: QrVersions.auto,
//     //     gapless: false,
//     //   ).toImageData(qrSize);
//     //   final dir = await getTemporaryDirectory();
//     //   final pathName = '${dir.path}/qr_tmp.png';
//     //   final qrFile = File(pathName);
//     //   final imgFile = await qrFile.writeAsBytes(uiImg.buffer.asUint8List());
//     //   final img = decodeImage(imgFile.readAsBytesSync());

//     //   bytes += ticket.image(img);
//     // } catch (e) {
//     //   print(e);
//     // }

//     // Print QR Code using native function
//     bytes += ticket.qrcode('example.com',size: QRSize.Size4);

//     ticket.feed(2);
//     ticket.cut();
//     return bytes;
//   }

// //   demoReceipt(PaperSize paper, CapabilityProfile profile) async {
// //     // final List<int> bytes = [];
// //     // Using default profile
// //     final profile = await CapabilityProfile.load();
// //     final Generator ticket = Generator(PaperSize.mm80, profile);
// //     List<int> bytes = [];

// //     // final ByteData data = await rootBundle.load('');
// //     // final Uint8List imageBytes = data.buffer.asUint8List();
// //     // final image = decodeImage(imageBytes);
// //     // bytes += ticket.image(image!);

// //     // Uint8List encArabic = await CharsetConverter.encode('cp864', "اهبتتنمن");

// //     // bytes += ticket.textEncoded(encArabic,
// //     //     styles: const PosStyles(
// //     //       height: PosTextSize.size2,
// //     //       width: PosTextSize.size2,
// //     //       align: PosAlign.center,
// //     //       bold: true,
// //     //     ));
// // // tinypng() async {
// // //   final bytes = Uint8List.fromList(widget.capturedImage);

// // //   // copy from decodeImageFromList of package:flutter/painting.dart
// // //   final codec = await instantiateImageCodec(bytes);
// // //   final frameInfo = await codec.getNextFrame();
// // //   return frameInfo.image;
// // // }
// //   //  bytes += ticket.image(widget.capturedImage.toString());
// //         // styles: const PosStyles(align: PosAlign.center), linesAfter: 2);
// // //
// // //
// //  //final img = decodeImage(widget.capturedImage.readAsBytesSync());
// // //  Print image
// //     // final ByteData data = await rootBundle.load(widget.capturedImage);
// //     // final Uint8List imageBytes = data.buffer.asUint8List();
// //     // final image = decodeImage(imageBytes);
// //     // bytes += ticket.image(image!);
// //    final dir = await getTemporaryDirectory();
// //       final pathName = '${dir.path}/qr_tmp.png';
// //       final qrFile = File(pathName);
// //       print("pathName"+pathName);
// //       final imgFile = await qrFile.writeAsBytes(widget.capturedImage.buffer.asUint8List());
// //       final img = decodeImage(imgFile.readAsBytesSync());

// //       bytes += ticket.image(img!);

// //       // bytes += ticket.image(widget.capturedImage!);
// //     ticket.feed(2);
// //     ticket.cut();
// //     return bytes;
// //   }

//   void _testPrint(PrinterBluetooth printer) async {
//     printerManager.selectPrinter(printer);

//     PaperSize paper = PaperSize.mm80;
//     final profile = await CapabilityProfile.load();
//     final PosPrintResult res = await printerManager
//         .printTicket((await demoReceipt(PaperSize.mm80, profile)));
//     print("&&&&&&&&&&&&&&&&&&&");
//     print(res.toString());
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         content: Text(res.msg),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final status = Permission.location.request().isGranted;
//     print(widget.compay.toString());
//     print(widget.address.toString());
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         shadowColor: Colors.transparent,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "printing".tr,
//               style: TextStyle(color: kblue),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Icon(
//                 Icons.arrow_forward,
//                 color: kblue,
//                 size: 30,
//               ),
//             )
//           ],
//         ),
//       ),
//       body: _devices.isEmpty
//           ? Center(child: Text(_devicesMsg ?? ''))
//           : ListView.builder(
//               itemCount: _devices.length,
//               itemBuilder: (c, i) => ListTile(
//                 leading: const Icon(Icons.print),
//                 title: Text(_devices[i].name!),
//                 subtitle: Text(_devices[i].address!),
//                 onTap: () {
//                   // Navigator.of(context).pop();
//                   _testPrint(_devices[i]);
//                   print(_devices[i]);
//                   print("***********************");
//                   _startPrint(_devices[i]);
//                   // _startScanDevices(_devices[i])
//                 },
//               ),
//             ),
//       floatingActionButton: StreamBuilder<bool>(
//         stream: printerManager.isScanningStream,
//         initialData: false,
//         builder: (c, snapshot) {
//           if (snapshot.data!) {
//             return FloatingActionButton(
//               child: Icon(Icons.stop),
//               onPressed: _stopScanDevices,
//               backgroundColor: Colors.red,
//             );
//           } else {
//             return FloatingActionButton(
//               child: Icon(Icons.search),
//               onPressed: _startScanDevices,
//             );
//           }
//         },
//       ),
//     );
//   }
// }
