import 'package:get/get.dart';

import '../controllers/show_invoices_controller.dart';

class ShowInvoicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowInvoicesController>(
      () => ShowInvoicesController(),
    );
  }
}
