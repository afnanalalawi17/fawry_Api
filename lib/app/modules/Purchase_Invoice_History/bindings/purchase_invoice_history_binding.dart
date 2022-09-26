import 'package:get/get.dart';

import '../controllers/purchase_invoice_history_controller.dart';

class PurchaseInvoiceHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseInvoiceHistoryController>(
      () => PurchaseInvoiceHistoryController(),
    );
  }
}
