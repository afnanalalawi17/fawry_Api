import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/confirm_phone.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PhoneController extends GetxController {
  //TODO: Implement PhoneController
  final GlobalKey<FormState> confirmFormKey = GlobalKey<FormState>();
  late TextEditingController codeController;
  final count = 0.obs;
  final email = Get.arguments[0];
  final token = GetStorage().read('Token');

  var code = '';
  @override
  void onInit() {
    super.onInit();
    codeController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    codeController.dispose();
  }

  void increment() => count.value++;
  
  String? validateCode(String value) {
    if (value.isEmpty) {
      return "Please enter the code".tr;
    }

    return null;
  }

  void checkLogin() {
    final isValid = confirmFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    auth();
  }

  Future<void> auth() async {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,   style: TextStyle(color: kblack),
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator(),
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      final _res =
          await ConfirmMobileNo(email.toString(), codeController.text, token);
     

    
       
         showSuccessSnackBar("Your phone number has been confirmed successfully".tr);

     Get.offAllNamed(Routes.BASIC);  

      update();
      print('user log in');
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
           showErrorSnackBar("There is an error, please try again".tr);

    }
  }
}
