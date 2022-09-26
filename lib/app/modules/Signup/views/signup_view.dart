import 'dart:async';
import 'dart:io';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  final controller = Get.put(SignupController());
  final lang = Get.put(AppLanguageController());

  @override
  Widget build(BuildContext context) {
    bool ActiveConnection = false;
String T = "";
Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('api.fawry-invoices.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
       
          ActiveConnection = true;
          T = "Turn off the data and repress again";
          showCupertinoDialog<String>(context: context, builder: (BuildContext context)=>
CupertinoAlertDialog(
  title: const Text('No connection'),
  content: const Text('Please check your internet connectivity'),
  actions: [
    TextButton(onPressed: ()async{
Navigator.pop(context,'Cancel');
// isAlertSet = false;
// isDeviceConnected = await InternetConnectionChecker().hasConnection;
// if(!isDeviceConnected){
//   showDialogBox();
//   isAlertSet=true;
//   update();
// }


    }, child: Text('OK'))

  ],
)
);
           print(T);
      controller.update();
      }
    } on SocketException catch (_) {
     
        ActiveConnection = false;
        T = "Turn On the data and repress again";
        print(T);
     controller.update();
    }
  }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: DismissKeyboard(
          child: Scaffold(
              appBar: Platform.isIOS
                  ? AppBar(
                      brightness: Brightness.dark,
                      elevation: 0.0,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      toolbarHeight: 0.0,
                    )
                  : null,
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightApp * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "new registration!".tr,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Welcome, get your invoice in the easiest way".tr,
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

                    //   ],
                    // ),
                    Form(
                      key: controller.SignupFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoxTextField(
                                textAlign: lang.appLocale == 'en'
                                    ? TextAlign.left
                                    : TextAlign.right,
                                controller: controller.firstnameController,
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  controller.firstname = value;
                                },
                                onChanged: (value) {
                                  controller.firstname = value;
                                },
                                validator: (value) {
                                  return controller.validateFirstName(value!);
                                },
                                label: "firstname".tr),
                            BoxTextField(
                                textAlign: lang.appLocale == 'en'
                                    ? TextAlign.left
                                    : TextAlign.right,
                                controller: controller.lastnameController,
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  controller.lastname = value;
                                },
                                onChanged: (value) {
                                  controller.lastname = value;
                                },
                                validator: (value) {
                                  return controller.validateLastName(value!);
                                },
                                label: "last name".tr),
                            BoxTextField(
                                textDirection: TextDirection.ltr,
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
                                  return controller.validateLastName(value!);
                                },
                                label: "admin@hotmail.com".tr),
                            BoxTextField(
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                hintText: "5xxxxxxxx",
                                controller: controller.phoneController,
                                keyboardType: TextInputType.phone,
                                onSaved: (value) {
                                  controller.phone = value;
                                },
                                onChanged: (value) {
                                  controller.phone = value;
                                },
                                validator: (value) {
                                  return controller.validateMobile(value!);
                                },
                                label: "5xxxxxxxx".tr),
                            Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      style: TextStyle(color: kblack),
                                      cursorColor:
                                          Theme.of(context).primaryColor,
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.left,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                                ? Icon(Icons
                                                    .visibility_off_outlined)
                                                : Icon(
                                                    Icons.visibility_outlined),
                                            onPressed: () {
                                              controller.changPassVisiblit();
                                            },
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: controller.obscureText.value,
                                      controller: controller.passwordController,
                                      onSaved: (value) {
                                        controller.password = value!;
                                      },
                                      onChanged: (value) {
                                        controller.password = value;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validatePassword(value!);
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
                                      style: TextStyle(color: kblack),
                                      cursorColor:
                                          Theme.of(context).primaryColor,
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.left,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                                ? Icon(Icons
                                                    .visibility_off_outlined)
                                                : Icon(
                                                    Icons.visibility_outlined),
                                            onPressed: () {
                                              controller.changPassVisiblit1();
                                            },
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText:
                                          controller.obscureText1.value,
                                      controller:
                                          controller.confirm_passwordController,
                                      onSaved: (value) {
                                        controller.confirm_password = value!;
                                      },
                                      onChanged: (value) {
                                        controller.confirm_password = value;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateRePassword(value!);
                                      },
                                    ),
                                  ],
                                )),
                            GetBuilder<SignupController>(
                              init: SignupController(),
                              initState: (_) {},
                              builder: (_) {
                                return FormField<bool>(
                                  validator: (value) {
                                    //  return controller.validateTerms(controller.terms);
                                  },
                                  builder: (state) {
                                    return CheckboxListTile(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0,
                                      ),
                                      value: controller.terms,
                                      onChanged: (newValue) {
                                        controller.checkBoxCheck(newValue!);
                                        print(controller.terms);
                                      },
                                      title: Row(
                                        children: [
                                          Text('Approval'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2),
                                          GestureDetector(
                                            onTap: () async {
                                              String url =
                                                  'https://privacy-policy.fawry-invoices.com';
                                              await launch(url,
                                                  forceSafariVC: false,
                                                  forceWebView: true);
                                            },
                                            child: Text(
                                              'Terms and Conditions'.tr,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .primaryColorDark,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                        ],
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    );
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: MainButton(
                                  text: "new account".tr,
                                  press: () {
                                    CheckUserConnection();
                                    // controller.getConnectivity();
                                    // controller.checkSignup();
                                  }),
                            ),
                            SizedBox(
                              height: heightApp * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("you have an account ?".tr,
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                  child: Text(
                                    "Log In".tr,
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontWeight: FontWeight.bold),
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
