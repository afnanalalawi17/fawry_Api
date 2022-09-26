import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_controller.dart';

class PhoneView extends GetView<PhoneController> {
            @override
  final controller = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: WillPopScope(
    onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
         resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

              centerTitle: true,
        title: 
             Text(
                  "Confirm your phone number".tr,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
            leading: BackButton(
                            color:  Theme.of(context).primaryColorDark,
                            onPressed: (){
                             Get.toNamed(Routes.BASIC);
                            },
                           ),
           
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: controller.confirmFormKey,
                child: Column(
                  children: [

                    
                  BoxTextField(
                       controller: controller.codeController,
                            keyboardType: TextInputType.phone
                            ,
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
                      SizedBox(
                      height: heightApp * 0.04,
                    ),
                    MainButton(text: "confirm".tr, press: () {controller.checkLogin();})
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
