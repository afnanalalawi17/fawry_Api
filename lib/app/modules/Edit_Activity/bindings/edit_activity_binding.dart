import 'package:get/get.dart';

import '../controllers/edit_activity_controller.dart';

class EditActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditActivityController>(
      () => EditActivityController(),
    );
  }
}
