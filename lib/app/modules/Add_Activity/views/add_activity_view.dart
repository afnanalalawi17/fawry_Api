import 'dart:async';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/Dropdown.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Services/add_activity.dart';
import 'package:fawry_app/app/data/Services/get_payment.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/modules/Activitys/controllers/activitys_controller.dart';
import 'package:fawry_app/app/modules/Add_Activity/controllers/add_activity_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/add_activity_controller.dart';

class AddActivityView extends GetView<AddActivityController> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  final controller = Get.put(AddActivityController());
  final controllerActivitys = Get.put(ActivitysController());

  final lang = Get.put(AppLanguageController());

  @override
  Widget build(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
    // context.read(dateController).formatDates();
  });
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
                  "new activity".tr,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                leading: BackButton(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    Get.offAndToNamed(Routes.BASIC);
                  },
                )),
            body: GetBuilder<AddActivityController>(
              init: AddActivityController(),
              initState: (_) {},
              builder: (_) {
                return SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                            key: controller.AddActivity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  Text(
                                      "Please fill in all fields to add your activity"
                                          .tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
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
                                        return controller.validateName(value!);
                                      },
                                      label: "activity Name".tr),
                                  BoxTextField(
                                      controller: controller.phoneController,
                                      keyboardType: TextInputType.phone,
                                      onSaved: (value) {
                                        controller.phone = value;
                                      },
                                      onChanged: (value) {
                                        controller.phone = value;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateMobile(value!);
                                      },
                                      label: "5xxxxxxxx".tr),
                                  BoxTextField(
                                      controller: controller.addressController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        controller.address = value;
                                      },
                                      onChanged: (value) {
                                        controller.address = value;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateAddress(value!);
                                      },
                                      label: "address".tr),
//                                   Dropdown(
                                    
//                                     hintText: 'Country selection'.tr,
//                                     items: lang.appLocale == 'en'
//                                         ? controller.PeriodList.map((value) {
//                                             return DropdownMenuItem(
//                                               value: value.countryEName.toString(),
//                                               child: Text(value.countryEName!),
//                                               onTap: () {
//                                                 print(
//                                                     "*************************");



// controller.currencyController.text= value.currencies![0].currencyEName.toString();
// controller.currencyID = value.currencies![0].currencyID.toString();

//                                                 controller.countryID =
//                                                     value.countryID.toString();
//                                                 controller.update();
//                                               },
//                                             );
//                                           }).toList()
//                                         : controller.PeriodList.map((value) {
//                                             return DropdownMenuItem<String>(
//                                               value:
//                                                   value.countryAName.toString(),
//                                               child: Text(value.countryAName
//                                                   .toString()),
//                                               onTap: () {
//                                                 print(
//                                                     "*************************");
//                                                 controller.countryID =
//                                                     value.countryID.toString();
//                                                    controller.currencyController.text = value.currencies![0].currencyAName.toString();
// controller.currencyID = value.currencies![0].currencyID.toString();

//                                                 // controller.fetchMYCurrencies();
//                                                 controller.update();
//                                               },
//                                             );
//                                           }).toList(),
//                                     validator: (value) {
//                                       if (value == null) {
//                                         return 'Please select a country'.tr;
//                                       }

//                                       return null;
//                                     },
//                                   ),
      Container(
                                                    // height: 60.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      color: kwhite,
                                                      //border: Border.all(color: kblue, width: 2)
                                                    ),
                                                    child:
                                                        DropdownButtonFormField(
                                                      // key: controller.key2,
                                                      iconEnabledColor:
                                                          Theme.of(context)
                                                              .primaryColor,

                                                      style: TextStyle(
                                                          color: kblack),
                                                      dropdownColor: kwhite,

                                                      //  key: controller.ADDdropFormKey,
                                                      validator: (value) {
                                                        print(
                                                            value.runtimeType);
                                                        if (value == null) {
                                                          return 'Please select a Categorie'
                                                              .tr;
                                                        }

                                                        return null;
                                                      },
                                                      isDense: true,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,

                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Categorie selection'
                                                                .tr,
                                                        hintStyle: TextStyle(
                                                            color: kblack,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                        border:
                                                            const OutlineInputBorder(),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      ),
                                                      items: lang.appLocale == 'en'
                                        ? controller.PeriodList.map((value) {
                                            return DropdownMenuItem(
                                              value: value.countryEName.toString(),
                                              child: Text(value.countryEName!),
                                              onTap: () {
                                                print(
                                                    "*************************");



controller.currencyController.text= value.currencies![0].currencyEName.toString();
controller.currencyID = value.currencies![0].currencyID.toString();

                                                controller.countryID =
                                                    value.countryID.toString();
                                                controller.update();
                                              },
                                            );
                                          }).toList()
                                        : controller.PeriodList.map((value) {
                                            return DropdownMenuItem<String>(
                                              value:
                                                  value.countryAName.toString(),
                                              child: Text(value.countryAName
                                                  .toString()),
                                              onTap: () {
                                                print(
                                                    "*************************");
                                                controller.countryID =
                                                    value.countryID.toString();
                                                   controller.currencyController.text = value.currencies![0].currencyAName.toString();
controller.currencyID = value.currencies![0].currencyID.toString();

                                                // controller.fetchMYCurrencies();
                                                controller.update();
                                              },
                                            );
                                          }).toList(),
                                                      onChanged: (newValue) {},

                                                      isExpanded: true,
                                                    ),
                                                  ),
                                                  SizedBox(height: heightApp*0.01,),
                                  BoxTextField(
                                    readOnly: true,
                                    controller: controller.currencyController,
                                    
                                    label: controller.currencyController.text.toString() ==''
                                    
                                    
                                  ?  'Currency selection'.tr.toString()
                                    
                                  :  controller.currencyController.text.toString(),
                                    textAlign:  lang.appLocale == 'en'
                                    
                                    ?TextAlign.left
                                    :TextAlign.right
                                    ),
                                  // Dropdown(
                                  //   validator: (value) {
                                  //     print(value.runtimeType);
                                  //     if (value == null) {
                                  //       return 'Please select a currency'.tr;
                                  //     }

                                  //     return null;
                                  //   },
                                  //   items: lang.appLocale == 'en'
                                  //       ? controller.PeriodList1.map(
                                  //           (value) {
                                  //           return DropdownMenuItem<String>(
                                  //             value: value.currencyID.toString(),
                                  //             child: Text(value.currencyEName
                                  //                 .toString()),
                                  //             onTap: () {
                                  //               controller.currencyID =
                                  //                   value.currencyID;
                                  //             },
                                  //           );
                                  //         }).toList()
                                  //       : controller.PeriodList1.map(
                                  //           (value) {
                                  //           return DropdownMenuItem<String>(
                                  //               value: value.currencyID.toString(),
                                  //             child: Text(value.currencyAName
                                  //                 .toString()),
                                  //             onTap: () {
                                  //               controller.currencyID =
                                  //                   value.currencyID;
                                  //             },
                                  //           );
                                  //         }).toList(),
                                  //   hintText: 'Currency selection'.tr,
                                  // ),
                                  BoxTextField(
                                      controller:
                                          controller.valueAddedTaxController,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        controller.valueAddedTax = value;
                                      },
                                      onChanged: (value) {
                                        controller.valueAddedTax = value;
                                      },
                                      validator: (value) {
                                        return controller.validate(value!);
                                      },
                                      label: "value added tax".tr),
                                  BoxTextField(
                                      controller:
                                          controller.commercialController,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        controller.commercial = value;
                                      },
                                      onChanged: (value) {
                                        controller.commercial = value;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateCommercial(value!);
                                      },
                                      label: "Commercial Register".tr),
                                  BoxTextField(
                                    controller: controller.expiryDateController,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.parse('2022-05-03'),
                                        lastDate: DateTime.parse('2025-05-03'),
                                      ).then((value) {
                                        // print(DateFormat.yMMMd().format(value!));
                                        controller.expiryDateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    label: "Commercial Registration Expiry Date"
                                        .tr,
                                    validator: (value) {
                                      return controller.validateData(value!);
                                    },
                                  ),
                                  FormField<bool>(
                                    validator: (value) {
                                      //  return controller.validateTerms(controller.terms);
                                    },
                                    builder: (state) {
                                      return CheckboxListTile(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        value: controller.terms,
                                        onChanged: (newValue) {
                                          print(controller.terms);
                                          // controller.terms = !controller.terms;
                                          print(controller.terms);
                                          if (!controller.terms == true) {
                                            controller.terms = false;
                                            print(controller.terms);
                                             controller.update();
                                          } else {
                                            controller.terms = true;
                                            print(controller.terms);
                                              controller.update();
                                          }

                                          controller.checkBoxCheck(newValue!);
                                          controller.update();
controller.numberController.clear();
                                        },
                                        title: Row(
                                          children: [
                                            Text(
                                                'The activity is subject to value added tax'
                                                    .tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4),
                                          ],
                                        ),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      );
                                    },
                                  ), 
                                   BoxTextField(
                                      onTap: () {

                                             controller.terms == false
                                            ?controller.numberController.clear()
                                            :controller.numberController;
                                        Future.delayed(Duration.zero, () async {
                                        controller.terms == false
                                            ? Get.rawSnackbar(
                                                duration: Duration(seconds: 4),
                                                snackStyle: SnackStyle.FLOATING,
                                                backgroundColor: Colors.red,
                                                borderRadius: 15,
                                                messageText: Text(
                                                  'Please select the activity subject to VAT to be able to enter the tax number'
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 10,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                isDismissible: true,
                                                forwardAnimationCurve:
                                                    Curves.bounceInOut,
                                                barBlur: 50,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.all(10),
                                              )
                                            : print("object");
                                            controller.update();
                                      });},
                                      readOnly: controller.terms == false
                                          ? true
                                          : false,
                                      controller:  controller.numberController,
                                   
                               
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        controller.number = value;
                                      },
                                      onChanged: (value) {
                                        controller.number = value;
                                      },
                                   
  validator: (value) {
    
Future.delayed(Duration.zero, () async {

   
                                        controller.terms == true
                                       
                                  ?  await   controller
                                            .validateNumber(value!)
                                            :null;
                                            controller.update();
    });  }   ,
                                      
                                      
                                      label: "Tax Number".tr),
                                  InkWell(
                                      onTap: () async {
                                        // await controller.getImage(ImageSource.gallery);

                                        showAdaptiveActionSheet(
                                          context: context,
                                          actions: <BottomSheetAction>[
                                            BottomSheetAction(
                                                title: Text(
                                                  'Camera'.tr,
                                                  //  / style: kBlack_18r,
                                                  textAlign: TextAlign.center,
                                                ),
                                                onPressed: (context) async {
                                                  await controller.getImage(
                                                      ImageSource.camera);
                                                                Navigator.pop(
                                                                context);
                                                }),
                                            BottomSheetAction(
                                                title: Text(
                                                  'Photo album'.tr,
                                                  textAlign: TextAlign.center,
                                                ),
                                                onPressed: (context) async {
                                                  await controller.getImage(
                                                      ImageSource.gallery);
                                                                Navigator.pop(
                                                                context);
                                                }),
                                          ],
                                          cancelAction: CancelAction(
                                              title: Text(
                                            'cancel'.tr,
                                            style: TextStyle(color: Colors.red),
                                          )),
                                        );
                                      },
                                      child: Container(
                                        // height: 140,

                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 2.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: kwhite),
                                        padding: const EdgeInsets.all(10),
                                        child: controller.image == null
                                            ? DottedBorder(
                                                strokeWidth: 2,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                dashPattern: const [10, 6],
                                                borderType: BorderType.RRect,
                                                radius:
                                                    const Radius.circular(12),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(12)),
                                                  child: Container(
                                                    // color: kwhite,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Center(
                                                      child: Text(
                                                        'activity logo'.tr,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Image(
                                                image: FileImage(
                                                    controller.image!),
                                                // height: 100,
                                                width: double.infinity,
                                                // fit: BoxFit.cover,
                                              ),
                                      )),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            BoxTextField(
                                                label: "Enter Coupon".tr),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: widthApp * 0.03,
                                      ),
                                      SizedBox(
                                        height: heightApp * 0.063,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              'APPLY',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: heightApp * 0.04,
                                  ),
                                  MainButton(
                                      text: "Add".tr,
                                      press: () async {
                                        final isValid = controller
                                            .AddActivity.currentState!
                                            .validate();
                                        if (!isValid) {
                                          return;
                                        }
                                        await RequestAddActivity(context);
                                      }),
                                  SizedBox(
                                    height: heightApp * 0.04,
                                  ),
                                ]))));
              },
            )),
      ),
    );
  }

  BuildContext? context1;
  Future<void> RequestAddActivity(BuildContext context2) async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,
              style: TextStyle(color: kblack),
            ),
            // 20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      print(controller.terms);
      final _res = await add_activity(
        controller.nameController.text,
        controller.nameController.text,
        controller.addressController.text,
        controller.numberController.text == ''
            ? '00000000000000000'
            : controller.numberController.text,
        controller.valueAddedTaxController.text,
        controller.commercialController.text,
        controller.currencyID.toString(),
        controller.countryID.toString(),
        controller.expiryDateController.text,
        controller.phoneController.text,
        controller.base64Image ?? '',
        controller.terms,
        controller.email.toString(),
        controller.token,
      );
      showSuccessSnackBar("Added successfully".tr);
      GetStorage().write('activityID', _res.data![0].companyID);
      controllerActivitys.fetchMYActivity();
      Get.offAllNamed(Routes.BASIC);
      controller.update();
      Get.back();
      if (Get.isDialogOpen == true) Get.back();
      GetStorage().write('activityID', _res.data![0].companyID);
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      showErrorSnackBar('There is an error, please try again'.tr);
    }
  }
}
