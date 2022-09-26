import 'package:get/get.dart';

import '../controllers/detials_report_controller.dart';

class DetialsReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetialsReportController>(
      () => DetialsReportController(),
    );
  }
}
