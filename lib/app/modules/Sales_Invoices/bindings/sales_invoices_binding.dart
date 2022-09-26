import 'package:get/get.dart';

import '../controllers/sales_invoices_controller.dart';

class SalesInvoicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesInvoicesController>(
      () => SalesInvoicesController(),
    );
  }
}
