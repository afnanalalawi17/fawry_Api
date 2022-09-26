import 'package:fawry_app/app/modules/Sales_Invoice_History/controllers/sales_invoice_history_controller.dart';
import 'package:get/get.dart';

class ShowInvoicesController extends GetxController {
    final controllerA = Get.put(SalesInvoiceHistoryController());

  //TODO: Implement ShowInvoicesController
  final activityID = Get.arguments[0];
  final activityName = Get.arguments[1];
  final address = Get.arguments[2];
  final taxNumber = Get.arguments[3];
  final activityLogo = Get.arguments[4]; 
  final invoiceID = Get.arguments[5];
  final totalAmount = Get.arguments[6];
  final totalIncludingTax = Get.arguments[7];
  final registerDate = Get.arguments[8];
 
  final registerTime = Get.arguments[9];
  final InvoiceDetailsList = Get.arguments[10];
  // final itemName = Get.arguments[10];
  // final itemID = Get.arguments[11];
  // final count = Get.arguments[12]; 
  // final amount = Get.arguments[13];
  // final invoiceIDIT = Get.arguments[14];
  // final itemDesc = Get.arguments[15];

late num  AllTotal = (double.parse(totalIncludingTax) - int.parse(totalAmount )) ;





  @override
  void onInit() {
    super.onInit();
    print("*******************");
    // print(itemName.toString());
print(InvoiceDetailsList.toString());
    // print(        [InvoiceDetailsList]
    //                                   .map((e) => [
    //                                         e['itemEName'],
    //                                         e['count'],
    //                                         e['amount'],
    //                                       ])
    //                                   .toList(),);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
