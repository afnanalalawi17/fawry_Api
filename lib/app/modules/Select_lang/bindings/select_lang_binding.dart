import 'package:get/get.dart';

import '../controllers/select_lang_controller.dart';

class SelectLangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLangController>(
      () => SelectLangController(),
    );
  }
}
