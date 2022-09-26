import 'package:get/get.dart';

import '../controllers/purchase_invoice_controller.dart';

class PurchaseInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseInvoiceController>(
      () => PurchaseInvoiceController(),
    );
  }
}
