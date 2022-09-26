import 'dart:io';
import 'dart:ui';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
          @override
  final controller = Get.put(LoginController());

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
    //  backgroundColor: kwhite,
    appBar: Platform.isIOS
          ? AppBar(
              brightness: Brightness.dark,
              elevation: 0.0,
              // backgroundColor: Colors.white,
              toolbarHeight: 0.0,
            )
          : null,
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(            crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      height: heightApp * 0.10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LogIn".tr,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Welcome again, log in and complete your transaction".tr,
                            style: TextStyle(
                                 color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightApp * 0.05,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Spacer(flex: 5),
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                    //     const Spacer(flex: 2),
                    //     Image.asset('assets/images/box_top.png'),
                    //   ],
                    // ),
                    Form(
                      key: controller.LoginFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: heightApp * 0.06,
                            ),
                            BoxTextField( textDirection: TextDirection.ltr,
                                 textAlign: TextAlign.left,
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) {
                                  controller.email = value;
                                },
                                onChanged: (value) {
                                  controller.email = value;
                                },
                                validator: (value) {
                                  return controller.validateEmail(value!);
                                },
                                label: "admin@hotmail.com ".tr),
                            Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(  style: TextStyle(color: kblack),cursorColor: Theme.of(context).primaryColor, textDirection: TextDirection.ltr,
                                 textAlign: TextAlign.left,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide:
                                                const BorderSide(color: Colors.red, width: 2),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                const BorderSide(color: Colors.red, width: 2),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: kwhite,
                                          contentPadding: EdgeInsets.all(20),
                                          hintText: 'password'.tr,
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
                                            },color: Theme.of(context).primaryColor,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.ENTER_REST_PASSWORD);
                                  },
                                  child: Text(
                                    'FPassword?'.tr,
                                   style: Theme.of(context).textTheme.subtitle2
                                  ),
                                ),
                              ],
                            ),
                            MainButton(
                                text: "Log In".tr,
                                press: () {
                                  controller.checkLogin();
                                }),
                            SizedBox(
                              height: heightApp * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don not have an account?".tr,
                          style: Theme.of(context).textTheme.subtitle2
                                ),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.offAllNamed(Routes.SIGNUP);
                                  },
                                  child: Text(
                                    "Register now".tr,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightApp * 0.03,
                    ),
                    // Image.asset('assets/images/box_bottom.png'),
                    SizedBox(
                      height: heightApp * 0.09,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
