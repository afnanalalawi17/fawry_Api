import 'package:get/get.dart';

import '../controllers/history2_controller.dart';

class History2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<History2Controller>(
      () => History2Controller(),
    );
  }
}
