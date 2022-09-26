import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Shared/widget/box_Text_Field.dart';
import '../controllers/edit_services_controller.dart';

class EditServicesView extends GetView<EditServicesController> {
      @override
  final controller = Get.put(EditServicesController());

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child:WillPopScope(
    onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
           appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            
            centerTitle: true,
            title:  Text(
                  "product modification".tr,
                 style: TextStyle(
                             
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                ),
                leading:BackButton(color: Theme.of(context).primaryColorDark,
                onPressed: (){
                     Get.offAllNamed(Routes.BASIC);
                },)
            
            
           
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: controller.editServicesFormKey,
                child: Column(
                  children: [
                    BoxTextField(
                       controller: controller.sellingController,
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              controller.selling = value;
                            },
                            onChanged: (value) {
                              controller.selling = value;
                            },
                            validator: (value) {
                              return controller.validate(value!);
                            },
                      
                      label: 'Product price'.tr),
// BoxTextField(
//                        controller: controller.purchasingController,
//                             keyboardType: TextInputType.number,
//                             onSaved: (value) {
//                               controller.purchasing = value;
//                             },
//                             onChanged: (value) {
//                               controller.purchasing = value;
//                             },
//                             validator: (value) {
//                               return controller.validate(value!);
//                             },
                      
//                       label: "Product purchase price".tr),BoxTextField(
//                        controller: controller.existingController,
//                             keyboardType: TextInputType.number,
//                             onSaved: (value) {
//                               controller.existing = value;
//                             },
//                             onChanged: (value) {
//                               controller.existing = value;
//                             },
//                             validator: (value) {
//                               return controller.validate(value!);
//                             },
                      
//                       label: "Minimum inventory".tr),
                    SizedBox(
                      height: heightApp * 0.04,
                    ),
                    MainButton(text: "confirm".tr, press: () {controller.checkEditServices();})
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
