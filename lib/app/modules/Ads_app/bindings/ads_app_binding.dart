import 'package:get/get.dart';

import '../controllers/ads_app_controller.dart';

class AdsAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdsAppController>(
      () => AdsAppController(),
    );
  }
}
