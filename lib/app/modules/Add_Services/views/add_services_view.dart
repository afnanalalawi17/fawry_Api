import 'package:dotted_border/dotted_border.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/Dropdown.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_services_controller.dart';

class AddServicesView extends GetView<AddServicesController> {
  @override
  final controller = Get.put(AddServicesController());
  final lang = Get.put(AppLanguageController());

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
              title: Text(
                "new product".tr,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              leading: BackButton(
                color: Theme.of(context).primaryColorDark,
                onPressed: () {
                 Get.offAndToNamed(Routes.BASIC,);
                },
              )),
          body: GetBuilder<AddServicesController>(
              init: AddServicesController(),
              initState: (_) {},
              builder: (_) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Form(
                    key: controller.AddServices,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightApp * 0.02,
                        ),
                        Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xffE22D2D).withOpacity(.40),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.red,
                                          size: 28,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                     "Please enter the selling price excluding tax".tr,                                           
                                          style:TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold,color: kblack),
                                        ),
                                      ],
                                    ),
                                  ),
                     
                        SizedBox(
                          height: heightApp * 0.02,
                        ),
                        BoxTextField(
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
                            label: 'product name'.tr),
                        Dropdown(validator:  (value) {
                            print(value.runtimeType);
                            if (value == null) {
                              return 'Please select a Unit'.tr;
                            }

                            return null;
                          }, items: lang.appLocale == 'en'
                              ? controller.UnitsList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.unitEName,
                                    child: Text(value.unitEName.toString()),
                                    onTap: () {
                                      controller.unitID = value.unitID;
                                      controller.unitEName = value.unitEName;
                                      controller.update();
                                    },
                                  );
                                }).toList()
                              : controller.UnitsList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.unitAName,
                                    child: Text(value.unitAName.toString()),
                                    onTap: () {
                                      controller.unitID = value.unitID;
                                      controller.unitAName = value.unitAName;
                                      controller.update();
                                    },
                                  );
                                }).toList(),   hintText: 'Unit selection'.tr,)  ,  
                    
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
                              if (value!.isEmpty) {
                                return "Please fill in the field".tr;
                                // ignore: unrelated_type_equality_checks
                              } else if (value == "0") {
                                return "Please fill in the field".tr;
                              }
                            },
                            label: "Product selling price".tr),
                        controller.unitEName == 'Service' ||
                                controller.unitAName == 'خدمة'
                                              ?    Container()
                   : BoxTextField(
                                controller: controller.purchasingController,
                                keyboardType: TextInputType.number,
                                onSaved: (value) {
                                  controller.purchasing = value;
                                },
                                onChanged: (value) {
                                  controller.purchasing = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please fill in the field".tr;
                                    // ignore: unrelated_type_equality_checks
                                  } else if (value == "0") {
                                    return "Please fill in the field".tr;
                                  }
                                },
                                label: "Product purchase price".tr),
                           
                        BoxTextField(
                            controller: controller.desController,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              controller.des = value;
                            },
                            onChanged: (value) {
                              controller.des = value;
                            },
                            validator: (value) {
                              return controller.validate(value!);
                            },
                            label: "product description".tr),

                        // SizedBox(
                        //   height: heightApp * 0.02,
                        // ),
                        // BoxTextField(
                        // controller: controller.unitController,
                        // keyboardType: TextInputType.text,
                        // onSaved: (value) {
                        //   controller.unit = value;
                        // },
                        // onChanged: (value) {
                        //   controller.unit = value;
                        // },
                        // validator: (value) {
                        //   return controller.validate(value!);
                        // },
                        // label: "measuring unit".tr),

//  BoxTextField(
//                         controller: controller.minimumController,
//                         keyboardType: TextInputType.text,
//                         onSaved: (value) {
//                           controller.minimum = value;
//                         },
//                         onChanged: (value) {
//                           controller.minimum = value;
//                         },
//                         validator: (value) {
//                           return controller.validate(value!);
//                         },
//                         label: "Minimum inventory".tr),
                 controller.unitEName == 'Service' ||
                                controller.unitAName == 'خدمة'
                                       ?    Container()
                   :  
                   
                    BoxTextField(
                      onTap: () {
                        
                      },
                            controller: controller.existingController,
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              controller.existing = value;
                            },
                            onChanged: (value) {
                              controller.existing = value;
                              controller.existingController.text.toString() == "0"
                        ?Get.rawSnackbar(
    duration: Duration(seconds: 2),
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.red,
    borderRadius: 15,
    messageText: Text(
      "Please add the quantity of stock to be purchased to be considered as the opening balance of the product".tr,
      textAlign: TextAlign.center,
      maxLines: 10,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.bounceInOut,
    barBlur: 50,
    snackPosition: SnackPosition.TOP,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
  ):print("object");
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please fill in the field".tr;
                                // ignore: unrelated_type_equality_checks
                              } 
                              return null;
                            },
                            label: "Quantity in stock".tr),
                                             controller.unitEName == 'Service' ||
                                controller.unitAName == 'خدمة'
                    ?    Container()
                   : Text(
                          "*" + "Opening balance".tr,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        SizedBox(
                          height: heightApp * 0.02,
                        ),
                                         controller.unitEName == 'Service' ||
                                controller.unitAName == 'خدمة'
                                ?Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Enable product inventory".tr,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            Transform.scale(
                                scale: 0.8,
                                child: Obx(
                                  () => Switch(
                                    activeColor:
                                        Theme.of(context).primaryColorDark,
                                    onChanged: (val) => controller.toggle(),
                                    value: controller.on.value,
                                  ),
                                ))
                          ],
                        ),

                        SizedBox(
                          height: heightApp * 0.04,
                        ),
                        MainButton(
                            text: "Add".tr,
                            press: () {
                              controller.checkAddServices();
                            })
                      ],
                    ),
                  ),
                ));
              }),
        ),
      ),
    );
  }
}
