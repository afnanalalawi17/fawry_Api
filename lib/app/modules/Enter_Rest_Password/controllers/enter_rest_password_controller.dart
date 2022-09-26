import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Shared/widget/ProgressIndicator.dart';
import '../../../data/Services/identity_services.dart';
import '../../../routes/app_pages.dart';

class EnterRestPasswordController extends GetxController {
  //TODO: Implement EnterRestPasswordController
 
final GlobalKey<FormState> VerifyRest = GlobalKey<FormState>(); // Form
  late TextEditingController 
     emailController;


  var  email = '';

 

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }
 @override
        void dispose() {
            // attempt to dispose controller when Widget is disposed
            try {
              
              emailController.dispose();
                } catch (e) {}
        }
        
  // @override
  // void onClose() {
  //   phoneORemailController.dispose();
  //   passwordController.dispose();

  // }

 


  
  


  
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter your email".tr;
    }
    if (!GetUtils.isEmail(value)) {
      return "Please enter a valid or email".tr;
    }
    return null;
  }
  void checkVerify() {
    final isValid = VerifyRest.currentState!.validate();
    if (!isValid) {
      return;
    }
    rest();
   
  } Future<void> rest() async {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
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
      final _res = await GetforgetPassOTP(emailController.text);
      if (Get.isDialogOpen == true) Get.back();
      if (_res == true) {
        Get.toNamed(Routes.REST_PASSWORD, arguments: [emailController.text]);
      }
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
   
        showErrorSnackBar('The email entered is not registered'.tr);
      
    }
  }
}
