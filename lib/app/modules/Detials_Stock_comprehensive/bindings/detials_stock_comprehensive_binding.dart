import 'package:get/get.dart';

import '../controllers/detials_stock_comprehensive_controller.dart';

class DetialsStockComprehensiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetialsStockComprehensiveController>(
      () => DetialsStockComprehensiveController(),
    );
  }
}
