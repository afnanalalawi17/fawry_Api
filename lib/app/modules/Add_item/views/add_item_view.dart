import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  @override
  final controller = Get.put(AddItemController()); final lang = Get.put(AppLanguageController());
 
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             appBar: AppBar(
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              title:  Text(
                            "Items".tr,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
              leading:BackButton( color: Theme.of(context).primaryColorDark,onPressed: (){
                 Get.offAndToNamed(Routes.BASIC);
              },)
              
              
           
            
            ),
            body: GetBuilder<AddItemController>(
                init: AddItemController(),
                initState: (_) {},
                builder: (_) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Form(
                        key: controller.AddItemFormKey,
                        child: Column(children: [
                          BoxTextField(
                            
                          textAlign: lang.appLocale == 'en'?TextAlign.left:TextAlign.right,
                                  controller: controller.nameController,
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    controller.name = value;
                                  },
                                  onChanged: (value) {
                                    controller.name = value;
                                  },
                                  validator: (value) {
                                    return controller.validate(value!);
                                  },
                                  label: "Type Name".tr
                            
                            ),
                            MainButton(text: "Add".tr, press: (){
                              controller.checkAddItem();
                            })
                        ]),

                      ),
                    ),
                  )
                  
                  
                  
                  
       
   ;}) ),
    ));
  }
}
