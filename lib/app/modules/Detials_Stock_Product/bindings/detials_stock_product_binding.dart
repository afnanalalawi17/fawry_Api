import 'package:get/get.dart';

import '../controllers/detials_stock_product_controller.dart';

class DetialsStockProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetialsStockProductController>(
      () => DetialsStockProductController(),
    );
  }
}
