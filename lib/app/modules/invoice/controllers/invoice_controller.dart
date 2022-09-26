import 'package:fawry_app/app/modules/Print/views/print_view.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  //TODO: Implement InvoiceController

  final controllerPrint = Get.put(PrintView());

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
final data = Get.arguments[10];
final data1 = Get.arguments[11];
late num  AllTotal = (double.parse(totalIncludingTax) - int.parse(totalAmount )) ;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
   
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
