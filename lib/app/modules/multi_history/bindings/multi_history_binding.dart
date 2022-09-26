import 'package:get/get.dart';

import '../controllers/multi_history_controller.dart';

class MultiHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultiHistoryController>(
      () => MultiHistoryController(),
    );
  }
}
