import 'package:get/get.dart';

import '../controllers/show_devices_controller.dart';

class ShowDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowDevicesController>(
      () => ShowDevicesController(),
    );
  }
}
