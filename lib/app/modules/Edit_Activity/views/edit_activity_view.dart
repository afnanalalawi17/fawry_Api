import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../controllers/edit_activity_controller.dart';

class EditActivityView extends GetView<EditActivityController> {
  @override
  final controller = Get.put(EditActivityController()); 

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
                    "Edit Company".tr,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  leading: BackButton(
                    color: Theme.of(context).primaryColorDark,
                    onPressed: () {
                    // controller.compayId==null;
              Get.back();
            

                   
                    },
                  ),
                ),
                body: GetBuilder<EditActivityController>(
                    init: EditActivityController(),
                    initState: (_) {},
                    builder: (_) {
                      return SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoxTextField(
                                      label: "activity Name".tr,
                                      controller: controller.nameController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        controller.name = value;
                                      },
                                      onChanged: (value) {
                                        controller.name = value;
                                      },
                                    ),
                                    BoxTextField(
                                      label: "phone number".tr,
                                      controller: controller.phoneController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        controller.phone = value;
                                      },
                                      onChanged: (value) {
                                        controller.phone = value;
                                      },
                                    ),
                                    BoxTextField(
                                      label: "address".tr,
                                      controller: controller.addressController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        controller.address = value;
                                      },
                                      onChanged: (value) {
                                        controller.address = value;
                                      },
                                    ),
                                    BoxTextField(
                                      controller: controller.dataController,
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate:
                                              DateTime.parse('2022-05-03'),
                                          lastDate:
                                              DateTime.parse('2025-05-03'),
                                        ).then((value) {
                                          // print(DateFormat.yMMMd().format(value!));
                                          controller.dataController.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      label:
                                          "Commercial Registration Expiry Date"
                                              .tr,
                                      // validator: (value) {
                                      //   return controller.validateData(value!);
                                      // },
                                    ),
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
                                                  }),
                                              BottomSheetAction(
                                                  title: Text(
                                                    'Photo album'.tr,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onPressed: (context) async {
                                                    await controller.getImage(
                                                        ImageSource.gallery);
                                                  }),
                                            ],
                                            cancelAction: CancelAction(
                                                title: Text(
                                              'cancel'.tr,
                                              style:
                                                  TextStyle(color: Colors.red),
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
                                                            Radius.circular(
                                                                12)),
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
SizedBox(height: heightApp*0.04,),
MainButton(text: "Edit", press: (){})



                                  ])));
                    }))));
  }
}
