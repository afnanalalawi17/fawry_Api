import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
              final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
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
          ?  AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
                centerTitle: true,
        title: 
              Text(
                  "Profile personly".tr,
                 style: TextStyle(
                             color: Theme.of(context).primaryColorDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                ),
            leading: BackButton(
                            color:  Theme.of(context).primaryColorDark,
                            onPressed: (){
                            Get.toNamed(Routes.BASIC);  
                            },
                           ),
          ):AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
                           centerTitle: true,
        title: 
              Text(
                  "Profile personly".tr,
                 style: TextStyle(
                             color: Theme.of(context).primaryColorDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                ),
            leading: BackButton(
                            color:  Theme.of(context).primaryColorDark,
                            onPressed: (){
                            Get.toNamed(Routes.BASIC);
                            },
                           ),
          
          ),
          body: GetBuilder<ProfileController>(
            init: ProfileController(),
            initState: (_) {},
            builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightApp * 0.05,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const Spacer(flex: 5),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          // const Spacer(flex: 2),
                          // Image.asset('assets/images/box_top.png'),
                        ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: controller.UpdateProfileFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            SizedBox(
                            height: heightApp * 0.06,
                            ),
                              BoxTextField(
                                controller: controller.firstNameController,
                                keyboardType: TextInputType.text,
                                // onSaved: (value) {
                                //   controller.name = value;
                                // },
                                // onChanged: (value) {
                                //   controller.name = value;
                                // },
                                validator: (value) {
                                  return controller.validateFirstName(value!);
                                },
                                label: "firstname".tr,
                              ),
                            
                            BoxTextField(
                            controller: controller.lastNameController,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                            controller.name = value;
                            },
                            onChanged: (value) {
                            controller.name = value;
                            },
                            validator: (value) {
                            return controller.validateLastName(value!);
                            },
                            label: "last name".tr,
                            ),
                         
                            BoxTextField(
                            controller: controller.phoneController,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                            controller.phone = value;
                            },
                            onChanged: (value) {
                            controller.phone = value;
                            },
                            validator: (value) {
                            return controller.validateMobile(value!);
                            },
                            label: "phone number".tr,
                            ),
                            SizedBox(
                            height: heightApp * 0.06,
                            ),
                            MainButton(text: "Edit".tr, press: () {
                              
                                           

                              controller.checkUpdatwe();
                              }
                              
                              ),
                            SizedBox(
                              height: heightApp * 0.02,
                            ),
                            MainButton(text: "change password".tr, press: () {Get.toNamed(Routes.CHANGE_PASSWORD);}),
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
              );
            },
          )),
        )));
  }
}
