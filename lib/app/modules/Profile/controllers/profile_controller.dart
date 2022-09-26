import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/update_profile.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final GlobalKey<FormState> UpdateProfileFormKey = GlobalKey<FormState>();
final token = GetStorage().read('Token');

  TextEditingController firstNameController = TextEditingController(
    text: GetStorage().read('firstName'),
  );
  TextEditingController lastNameController = TextEditingController(
    text: GetStorage().read('lastName'),
  );
  TextEditingController emailController = TextEditingController(
    text: GetStorage().read('email'),
  );
  TextEditingController phoneController = TextEditingController(
    text: GetStorage().read('phone'),
  );
  var name = '';

  var email = '';
  var phone = '';
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print(GetStorage().read('email'));
    firstNameController = TextEditingController(
      text: GetStorage().read('firstName'),
    );
    lastNameController = TextEditingController(
      text: GetStorage().read('lastName'),
    );

    emailController = TextEditingController(
      text: GetStorage().read('email'),
    );
    phoneController = TextEditingController(text: GetStorage().read('phone'));
  }

  @override
  void onReady() {
    super.onReady();
    firstNameController = TextEditingController(
      text: GetStorage().read('firstName'),
    );
    lastNameController = TextEditingController(
      text: GetStorage().read('lastName'),
    );

    emailController = TextEditingController(
      text: GetStorage().read('email'),
    );
    phoneController = TextEditingController(text:GetStorage().read('phone'));
  }
  @override
  void dispose() {
    // attempt to dispose controller when Widget is disposed
    try {
        firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    } catch (e) {}
  }
  // @override
  // void onClose() {
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   emailController.dispose();
  //   phoneController.dispose();
  // }

  void increment() => count.value++;
  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return "الرجاء ادخال الاسم الاول";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return "الرجاء ادخال الاسم الاخير";
    }
    return null;
  }

  String? validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{9}$';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "الرجاء ادخال رقم الهاتف";
    } else if (!regExp.hasMatch(value)) {
      return "الرجاء ادخال رقم هاتف صحيح";
    }
    // else if ( value.length < 7){
    //                                                         return "الرجاء ادخال رقم هاتف صحيح";

    //                         }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "الرجاء ادخال رقم البريد الالكتوني";
    }
    if (!GetUtils.isEmail(value)) {
      return "الرجاء ادخال بريد الكتروني صحيح";
    }
    return null;
  }

  void checkUpdatwe() {
    final isValid = UpdateProfileFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Update();
  }

  Future<void> Update() async {
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
      final _res = await Update_ProfileUser(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        phoneController.text,
        token
      );
     
 if (Get.isDialogOpen == true) Get.back();  
showSuccessSnackBar("Data has been updated successfully".tr);
      update();
      print('update');
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      // var ex = 'اسم المستخدم أو كلمة المرور خطا';
      showErrorSnackBar("There is an error, please try again".tr);
    }
  }
}
