import 'package:get/get.dart';

import '../controllers/rest_password_controller.dart';

class RestPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestPasswordController>(
      () => RestPasswordController(),
    );
  }
}
