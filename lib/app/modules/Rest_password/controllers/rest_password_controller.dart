import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/rest_pass_services.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestPasswordController extends GetxController {
  //TODO: Implement RestPasswordController
  final GlobalKey<FormState> RestFormKey = GlobalKey<FormState>(); 
 final email = Get.arguments[0]; 
 
  late TextEditingController codeController,
      
   
      passwordController,
      confirm_passwordController;
  var code = '';

  var password = '';
  var confirm_password = '';
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     codeController= TextEditingController();
   
    passwordController = TextEditingController();
    confirm_passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
     codeController.dispose();

    passwordController.dispose();
    confirm_passwordController.dispose();}
  void increment() => count.value++;

      var obscureText = true.obs;
    var obscureText1 = true.obs;
   var terms = false;
changPassVisiblit() {
    if (obscureText.value == true) {
      obscureText(false);
    } else {
      obscureText(true);
    }
  }changPassVisiblit1() {
    if (obscureText1.value == true) {
      obscureText1(false);
    } else {
      obscureText1(true);
    }
  }  String? validateCode(String value) {
      if (value.isEmpty) {
      return "Please enter the code".tr;
    }
  
    return null;
  }
   String? validatePassword(String value) {
       String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp =  RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter the password".tr;
    }
   else if (!regExp.hasMatch(value)) {
      return "Please enter a password that contains symbols uppercase letters, lowercase letters and numbers".tr;
    }
    return null;
  }


  String? validateRePassword(String value) {
    if (value.isEmpty) {
      return "Please enter confirm password".tr;
    }
    if (value != confirm_passwordController.text) {
      return "Password does not match".tr;
    }
    return null;
  }  void checkRest() {
    final isValid = RestFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }ResetPassAPI();
  } 
  Future<void> ResetPassAPI() async {
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
            Custom_ProgressIndicator(),
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      final _res = await StartResetPass(
        passwordController.text,
        codeController.text,
        email.toString()

     
      );
      if (Get.isDialogOpen == true) Get.back();
      if (_res == true) {
          showSuccessSnackBar("Password changed successfully".tr);
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
        showErrorSnackBar("Invalid verification code entered".tr);
    }
  }
}
