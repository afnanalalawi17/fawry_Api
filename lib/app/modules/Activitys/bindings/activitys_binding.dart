import 'package:get/get.dart';

import '../controllers/activitys_controller.dart';

class ActivitysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivitysController>(
      () => ActivitysController(),
    );
  }
}
