import 'package:get/get.dart';

import '../controllers/boarding_controller.dart';

class BoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardingController>(
      () => BoardingController(),
    );
  }
}
