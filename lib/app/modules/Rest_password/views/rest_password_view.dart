import 'dart:io';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/rest_password_controller.dart';

class RestPasswordView extends GetView<RestPasswordController> {
                @override
  final controller = Get.put(RestPasswordController());

  @override
  Widget build(BuildContext context) {
 return AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle(
    statusBarColor: Theme.of(context).scaffoldBackgroundColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ),
   
      child: DismissKeyboard(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
     resizeToAvoidBottomInset: false,
    appBar: Platform.isIOS
        ?  
 AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: 
            Text(
              "change password".tr,
                   style: TextStyle(
                             color: Theme.of(context).primaryColorDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
            ),
            leading: BackButton(
                            color:  Theme.of(context).primaryColorDark,
                            onPressed: (){
                              Get.offAllNamed(Routes.LOGIN);
                            },
                           ),
            // GestureDetector(
            //   onTap: () {
            //         Get.offAllNamed(Routes.LOGIN);
            //   },
            //   child: Icon(
            //     Icons.arrow_forward,
            //     color: Theme.of(context).primaryColorDark,
            //     size: 30,
            //   ),
            // )
        
      ):AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
         centerTitle: true,
        title: 
            Text(
              "change password".tr,
                   style: TextStyle(
                             color: Theme.of(context).primaryColorDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
            ),
            leading: BackButton(
                            color:  Theme.of(context).primaryColorDark,
                            onPressed: (){
                              Get.offAllNamed(Routes.LOGIN);
                            },
                           ),
      ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: controller.RestFormKey,
                child: Column(
                  children: [
                    BoxTextField(
                       controller: controller.codeController,
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              controller.code = value;
                            },
                            onChanged: (value) {
                              controller.code = value;
                            },
                            validator: (value) {
                              return controller.validateCode(value!);
                            },
                      
                      label: "code".tr),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                               style: TextStyle(color: kblack),
                                      cursorColor: Theme.of(context).primaryColor,
                              
                              textDirection: TextDirection.ltr,
                                   textAlign: TextAlign.left,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red, width: 2),
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
                    SizedBox(
                      height: heightApp * 0.02,
                    ),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(   style: TextStyle(color: kblack),
                                      cursorColor: Theme.of(context).primaryColor,
                              textDirection: TextDirection.ltr,
                                   textAlign: TextAlign.left,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: kwhite,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: 'confirm password'.tr,
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
                                    },color: Theme.of(context).primaryColor,
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.obscureText1.value,
                              controller: controller.confirm_passwordController,
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
                    MainButton(text: "confirm".tr, press: () {controller.checkRest();})
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
