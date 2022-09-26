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

import '../controllers/enter_rest_password_controller.dart';

class EnterRestPasswordView extends GetView<EnterRestPasswordController> {
        @override
  final controller = Get.put(EnterRestPasswordController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle(
    statusBarColor: Theme.of(context).scaffoldBackgroundColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ),
   
      child: DismissKeyboard(
        child: WillPopScope(
    onWillPop: () async => false,
          child: Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    appBar: Platform.isIOS
          ? AppBar(
              brightness: Brightness.dark,
              elevation: 0.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              toolbarHeight: 0.0,
            )
          : null,
              resizeToAvoidBottomInset: false,
   
              body: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                     SizedBox(
                      height: heightApp * 0.10,
                    ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           BackButton(
                            color:  Theme.of(context).primaryColorDark,
                            onPressed: (){
                              Get.offAllNamed(Routes.LOGIN);
                            },
                           ),
                          Column(                  crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                         
                              Text(
                                      "Forgot your password".tr,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "A link will be sent to reset your password".tr,
                                      style: TextStyle(
                                              color: Theme.of(context).hintColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ],
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
                    //     // Image.asset(
                    //     //   'assets/images/logo.png',
                    //     //   width: 120,
                    //     //   height: 100,
                    //     //   fit: BoxFit.cover,
                    //     // ),
                    //     const Spacer(flex: 2),
                    //     Image.asset('assets/images/box_top.png'),
                    //   ],
                    // ),
                    Form(
                      key: controller.VerifyRest,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            SizedBox(
                              height: heightApp * 0.10,
                            ),
                            
                          
                            BoxTextField(  textDirection: TextDirection.ltr,
                                 textAlign: TextAlign.left,
                                  hintText: "admin@hotmail.com",
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
                                label: "admin@hotmail.com".tr),
                            
                            
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: MainButton(text: "send".tr, press: () {
                                
                                controller.checkVerify();}),
                            ),
                            SizedBox(
                              height: heightApp * 0.02,
                            ),
                           
                          ],
                        ),
                      ),
                    ),  SizedBox(
                      height: heightApp * 0.06,
                    ),
                    // Image.asset('assets/images/box_bottom.png'),
                    SizedBox(
                      height: heightApp * 0.04,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
