import 'package:get/get.dart';

import '../controllers/sales_invoice_history_controller.dart';

class SalesInvoiceHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesInvoiceHistoryController>(
      () => SalesInvoiceHistoryController(),
    );
  }
}
