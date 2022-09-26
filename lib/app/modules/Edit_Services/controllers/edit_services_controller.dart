import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/edit_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../Shared/widget/ProgressIndicator.dart';
import '../../../routes/app_pages.dart';
import '../../Services/controllers/services_controller.dart';

class EditServicesController extends GetxController {
  //TODO: Implement EditServicesController
  // final controllerServices = Get.put(ServicesController());
  final GlobalKey<FormState> editServicesFormKey = GlobalKey<FormState>();
  final count = 0.obs;
  final Id = Get.arguments[0];
  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
  final activityID = GetStorage().read('activityID');

  late TextEditingController  sellingController,
      purchasingController,
      minimumController,
      existingController;
   var selling = '';

  var purchasing = '';
  var minimum = '';
  var  existing = '';

  @override
  void onInit() {
    super.onInit();
    sellingController = TextEditingController();
    purchasingController = TextEditingController();
    minimumController = TextEditingController();
    existingController = TextEditingController();
    print("*********************************************************");
    // print(Id.toString());
    print(token);
    print(email);
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {}
  @override
  void dispose() {
    // attempt to dispose controller when Widget is disposed
    try {
      sellingController.dispose();
      purchasingController.dispose();
      minimumController.dispose();
      existingController.dispose();
    } catch (e) {}
  }

  String? validate(String value) {
    if (value.isEmpty) {
      return "Please fill in the field".tr;
    }

    return null;
  }

  void checkEditServices() {
    final isValid = editServicesFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    RequestEditServices();
  }

  Future<void> RequestEditServices() async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,  style: TextStyle(color: kblack),
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      final _res = await edit_Services(
        sellingController.text,
        Id.toString(),
        email.toString(),
        token,
      );
      var ex = 'The product price has been modified successfully'.tr;
      showSuccessSnackBar(ex);
      // controllerServices.fetchMYServices();
      Get.offAndToNamed(Routes.BASIC);
      sellingController.clear();
      update();
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
            showErrorSnackBar('There is an error, please try again'.tr);

    }
  }

  void increment() => count.value++;
}
