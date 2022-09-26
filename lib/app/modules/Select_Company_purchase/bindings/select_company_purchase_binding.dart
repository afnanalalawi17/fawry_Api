import 'package:get/get.dart';

import '../controllers/select_company_purchase_controller.dart';

class SelectCompanyPurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCompanyPurchaseController>(
      () => SelectCompanyPurchaseController(),
    );
  }
}
