import 'dart:io';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        child: DismissKeyboard(
            child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: Platform.isIOS
                ? AppBar(
                    automaticallyImplyLeading: false,
                    // backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      "change password".tr,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    leading: BackButton(
                      color: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                : AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      "change password".tr,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    leading: BackButton(
                      color: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Form(
                  key: controller.ChangeFormKey,
                  child: Column(
                    children: [
                      Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red,width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red,width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: kwhite,
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: 'Old Password'.tr,
                                    hintStyle: TextStyle(
                                        color: kblack,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                    suffixIcon: IconButton(
                                      icon: controller.obscureText.value
                                          ? Icon(Icons.visibility_off_outlined)
                                          : Icon(Icons.visibility_outlined),
                                      onPressed: () {
                                        controller.changPassVisiblit();
                                      },
                                      color: Theme.of(context).primaryColor,
                                    )),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.obscureText.value,
                                controller: controller.passwordController,
                                onSaved: (value) {
                                  controller.password = value!;
                                },
                                onChanged: (value) {
                                  controller.password = value;
                                },
                                validator: (value) {
                                  return controller.validatePassword(value!);
                                },
                              ),
                            ],
                          )),
                      SizedBox(
                        height: heightApp * 0.02,
                      ),
                      Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red,width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red,width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: kwhite,
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: 'new password'.tr,
                                    hintStyle: TextStyle(
                                        color: kblack,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                    suffixIcon: IconButton(
                                      icon: controller.obscureText1.value
                                          ? Icon(Icons.visibility_off_outlined)
                                          : Icon(Icons.visibility_outlined),
                                      onPressed: () {
                                        controller.changPassVisiblit1();
                                      },
                                      color: Theme.of(context).primaryColor,
                                    )),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.obscureText1.value,
                                controller: controller.newpasswordController,
                                onSaved: (value) {
                                  controller.newpassword = value!;
                                },
                                onChanged: (value) {
                                  controller.newpassword = value;
                                },
                                validator: (value) {
                                  return controller.validatePassword(value!);
                                },
                              ),
                            ],
                          )),
                      SizedBox(
                        height: heightApp * 0.02,
                      ),
                      Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red,width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red,width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: kwhite,
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: 'Confirm the new password'.tr,
                                    hintStyle: TextStyle(
                                        color: kblack,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                    suffixIcon: IconButton(
                                      icon: controller.obscureText2.value
                                          ? Icon(Icons.visibility_off_outlined)
                                          : Icon(Icons.visibility_outlined),
                                      onPressed: () {
                                        controller.changPassVisiblit2();
                                      },
                                      color: Theme.of(context).primaryColor,
                                    )),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.obscureText2.value,
                                controller:
                                    controller.confirm_passwordController,
                                onSaved: (value) {
                                  controller.confirm_password = value!;
                                },
                                onChanged: (value) {
                                  controller.confirm_password = value;
                                },
                                validator: (value) {
                                  return controller.validateRePassword(value!);
                                },
                              ),
                            ],
                          )),
                      SizedBox(
                        height: heightApp * 0.04,
                      ),
                      MainButton(
                          text: "confirm".tr,
                          press: () {
                            controller.checkChange();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}
