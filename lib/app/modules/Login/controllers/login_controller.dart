import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/Login_Stat_Controller.dart';
import 'package:fawry_app/app/data/Services/login_services.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LoginController extends GetxController {
  //TODO: Implement LoginController
  final loginState = Get.put(LoginStateController());

  final GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>(); // Form
  late TextEditingController emailController, passwordController;

  var email = '';

  var password = '';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
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
      passwordController.dispose();
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
    } else if ( !GetUtils.isEmail(value)) {
      return "Please enter a valid or email".tr;
    }
    return null;
  }

  var obscureText = true.obs;

  changPassVisiblit() {
    if (obscureText.value == true) {
      obscureText(false);
    } else {
      obscureText(true);
    }
  }

  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter the password".tr;
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a password that contains symbols uppercase letters, lowercase letters and numbers".tr;
    }
    return null;
  }

  void checkLogin() {
    final isValid = LoginFormKey.currentState!.validate();
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
      final _res = await Login(
        emailController.text,
        passwordController.text,
      );

      showSuccessSnackBar('You are logged in successfully'.tr);
      Get.offAllNamed(Routes.BASIC);

      loginState.changeLoginState('Login');

      GetStorage().write('Token', _res.data![0].token);
      GetStorage().write('phone', _res.data![0].mobileNo);
      GetStorage().write('email', _res.data![0].email);
      GetStorage().write('firstName', _res.data![0].firstName);
      GetStorage().write('lastName', _res.data![0].lastName);
      GetStorage().write('mobileNoConfirmed', _res.data![0].mobileNoConfirmed);
      update();
     
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      var ex = 'Username or password wrong'.tr;
      showErrorSnackBar(ex);
    }
  }
}
