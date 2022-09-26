import 'package:get/get.dart';

import '../controllers/add_activity_controller.dart';

class AddActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddActivityController>(
      () => AddActivityController(),
    );
  }
}
