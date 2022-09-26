import 'package:get/get.dart';

import '../controllers/select_company_sales_controller.dart';

class SelectCompanySalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCompanySalesController>(
      () => SelectCompanySalesController(),
    );
  }
}
