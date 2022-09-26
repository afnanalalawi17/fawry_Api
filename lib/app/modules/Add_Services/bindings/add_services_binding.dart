import 'package:get/get.dart';

import '../controllers/add_services_controller.dart';

class AddServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddServicesController>(
      () => AddServicesController(),
    );
  }
}
