import 'package:get/get.dart';

import '../controllers/delete_company_controller.dart';

class DeleteCompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteCompanyController>(
      () => DeleteCompanyController(),
    );
  }
}
