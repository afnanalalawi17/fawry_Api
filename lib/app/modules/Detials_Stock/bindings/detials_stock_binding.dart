import 'package:get/get.dart';

import '../controllers/detials_stock_controller.dart';

class DetialsStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetialsStockController>(
      () => DetialsStockController(),
    );
  }
}
