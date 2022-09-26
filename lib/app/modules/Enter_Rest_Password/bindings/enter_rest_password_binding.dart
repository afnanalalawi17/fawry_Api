import 'package:get/get.dart';

import '../controllers/enter_rest_password_controller.dart';

class EnterRestPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterRestPasswordController>(
      () => EnterRestPasswordController(),
    );
  }
}
