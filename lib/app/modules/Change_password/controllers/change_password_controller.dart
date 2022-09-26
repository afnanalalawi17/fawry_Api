import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/change_password.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController

  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
  final GlobalKey<FormState> ChangeFormKey = GlobalKey<FormState>(); // Form
  late TextEditingController passwordController,
      newpasswordController,
      confirm_passwordController;

  var password = '';
  var newpassword = '';
  var confirm_password = '';
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();

    newpasswordController = TextEditingController();
    confirm_passwordController = TextEditingController();
    print("object");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newpasswordController.dispose();

    passwordController.dispose();
    confirm_passwordController.dispose();
  }

  void increment() => count.value++;

  var obscureText = true.obs;
  var obscureText1 = true.obs;
  var obscureText2 = true.obs;
  var terms = false;
  changPassVisiblit() {
    if (obscureText.value == true) {
      obscureText(false);
    } else {
      obscureText(true);
    }
  }

  changPassVisiblit1() {
    if (obscureText1.value == true) {
      obscureText1(false);
    } else {
      obscureText1(true);
    }
  }

  changPassVisiblit2() {
    if (obscureText2.value == true) {
      obscureText2(false);
    } else {
      obscureText2(true);
    }
  }

  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter the password".tr;
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a password that contains symbols uppercase letters, lowercase letters and numbers"
          .tr;
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
  }

  void checkChange() {
    final isValid = ChangeFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    ChangePassAPI();
  }

  Future<void> ChangePassAPI() async {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,
              style: TextStyle(color: kblack),
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator(),
          ],
        ),
      ),
      barrierDismissible: false,
    );
    

    try {
      final _res = await StartChangePass(
          passwordController.text,
          newpasswordController.text,
          confirm_passwordController.text,
          email.toString(),
          token);
      print("sucess");

      showSuccessSnackBar("Password changed successfully".tr);
      Get.offAllNamed(Routes.PROFILE);
    } catch (e) {
      print("error");

      if (Get.isDialogOpen == true) Get.back();
      showErrorSnackBar("The old password is incorrect".tr);
    }
  }
}
