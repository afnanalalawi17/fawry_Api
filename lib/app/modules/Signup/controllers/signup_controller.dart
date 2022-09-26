import 'dart:async';
import 'dart:io';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/Login_Stat_Controller.dart';
import 'package:fawry_app/app/data/Services/signup_services.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

class SignupController extends GetxController {
  final loginState = Get.put(LoginStateController());
  final lang = Get.put(AppLanguageController());
  //TODO: Implement SignupController
  final GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>(); // Form
  late TextEditingController firstnameController,
      lastnameController,
      phoneController,
      emailController,
      passwordController,
      confirm_passwordController;
  var firstname = '';
  var lastname = '';
  var phone = '';
  var email = '';
  var password = '';
  var confirm_password = '';
  var obscureText = true.obs;
  var obscureText1 = true.obs;
  var terms = false;

 late BuildContext context1;
  late StreamSubscription subscription;
var isDeviceConnected = false;
bool isAlertSet = false;
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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirm_passwordController = TextEditingController();
    // getConnectivity();
//  CheckUserConnection();
  }
// bool ActiveConnection = false;
// String T = "";
// Future CheckUserConnection() async {
//     try {
//       final result = await InternetAddress.lookup('api.fawry-invoices.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
       
//           ActiveConnection = true;
//           T = "Turn off the data and repress again";
//           showCupertinoDialog<String>(context: context1, builder: (BuildContext context)=>
// CupertinoAlertDialog(
//   title: const Text('No connection'),
//   content: const Text('Please check your internet connectivity'),
//   actions: [
//     TextButton(onPressed: ()async{
// Navigator.pop(context,'Cancel');
// isAlertSet = false;
// isDeviceConnected = await InternetConnectionChecker().hasConnection;
// if(!isDeviceConnected){
//   showDialogBox();
//   isAlertSet=true;
//   update();
// }


//     }, child: Text('OK'))

//   ],
// )
// );
//            print(T);
//       update();
//       }
//     } on SocketException catch (_) {
     
//         ActiveConnection = false;
//         T = "Turn On the data and repress again";
//         print(T);
//      update();
//     }
//   }
// getConnectivity() =>
// subscription =Connectivity().onConnectivityChanged.listen((event) async{
//   isDeviceConnected = await InternetConnectionChecker().hasConnection;
//   if(!isDeviceConnected&& isAlertSet == false){
//      showDialogBox();
//      isAlertSet = true;
//      update();
//   }
//   print(isDeviceConnected);
// });
// showDialogBox() =>showCupertinoDialog<String>(context: context1, builder: (BuildContext context)=>
// CupertinoAlertDialog(
//   title: const Text('No connection'),
//   content: const Text('Please check your internet connectivity'),
//   actions: [
//     TextButton(onPressed: ()async{
// Navigator.pop(context,'Cancel');
// isAlertSet = false;
// isDeviceConnected = await InternetConnectionChecker().hasConnection;
// if(!isDeviceConnected){
//   showDialogBox();
//   isAlertSet=true;
//   update();
// }


//     }, child: Text('OK'))

//   ],
// )
// );
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
    phoneController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirm_passwordController.dispose();
  }

  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return "Please enter the first name".tr;
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return "Please enter the last name".tr;
    }
    return null;
  }

  String? validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{9}$';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "Please enter the phone number".tr;
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid phone number".tr;
    }
  
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter your email".tr;
    }
    if (!GetUtils.isEmail(value)) {
      return "Please enter a valid or email".tr;
    }
    return null;
  }

  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp =  RegExp(pattern);
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

  void checkBoxCheck(bool value) {
    terms = value;
    update();
  }


  void checkSignup() {
    final isValid = SignupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (terms == true) {
      StartRegister();
    } else {
      showErrorSnackBar('You must agree to the privacy terms'.tr);
    }
  }

  Future<void> StartRegister() async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,
              style: TextStyle(color: kblack),
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      final _res = await Register(
        email: emailController.text,
        firstnameAR: firstnameController.text,
        lastnameAR: lastnameController.text,
        firstnameEN: firstnameController.text,
        lastnameEN: lastnameController.text,
        phone: phoneController.text,
        password: passwordController.text,
      );
      showSuccessSnackBar('Account has been successfully registered'.tr);
      Get.offAndToNamed(
        Routes.LOGIN,
      );
      loginState.changeLoginState('Login');

      GetStorage().write('email', _res.data!.email);
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      var ex = 'The account is already registered'.tr;
      showErrorSnackBar(ex);
    }
  }
}
