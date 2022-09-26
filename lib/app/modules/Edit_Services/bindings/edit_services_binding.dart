import 'package:get/get.dart';

import '../controllers/edit_services_controller.dart';

class EditServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditServicesController>(
      () => EditServicesController(),
    );
  }
}
