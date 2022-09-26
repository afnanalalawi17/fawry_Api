import 'dart:ui';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/modules/Basic/views/basic_view.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../../../../Shared/widget/ProgressIndicator.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  @override
  final controller = Get.put(ServicesController());
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
                "Products".tr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              leading: BackButton(
                color: Theme.of(context).primaryColorDark,
                onPressed: () {
                  // controller.companyId== null;

                  Get.offNamed(Routes.ITEMS,
                      arguments: [controller.companyId]);

                  controller.update();
                },
              ),
            ),
            body: GetBuilder<ServicesController>(
                init: ServicesController(),
                initState: (_) {},
                builder: (_) {
                  return Obx(() => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ))
                      : controller.categoriesLis.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Color(0xffE22D2D)
                                                .withOpacity(.40),
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                                                lang.appLocale == 'en'
                                                    ? "Swipe left to delete activity"
                                                        .tr
                                                        .tr
                                                    : "Swipe right to delete activity"
                                                        .tr
                                                        .tr,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: kblack),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: heightApp * 0.01,
                                        );
                                      },
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 20),
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount:
                                          controller.categoriesLis.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    59, 59, 152, 0.2),
                                                blurRadius: 30,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Slidable(
                                            // create a key
                                            key: const ValueKey('key'),
                                            startActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.id = controller
                                                        .categoriesLis[index]
                                                        .itemID
                                                        .toString();
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            scrollable: true,
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12.0))),
                                                            content: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                  "Are you sure to delete this product?"
                                                                      .tr),
                                                            ),
                                                            actionsAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                  "yes".tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  controller.RequestDeleteServices(
                                                                      controller
                                                                          .id);
                                                                },
                                                              ),
                                                              TextButton(
                                                                child: Text(
                                                                    "cancel"
                                                                        .tr),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Container(
                                                    height: 100,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    width: 85,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            lang.appLocale ==
                                                                    'en'
                                                                ? BorderRadius
                                                                    .horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            12),
                                                                  )
                                                                : BorderRadius
                                                                    .horizontal(
                                                                    right: Radius
                                                                        .circular(
                                                                            12),
                                                                  )),
                                                    child: Image.asset(
                                                        'assets/images/trash.png'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          controller
                                                              .categoriesLis[
                                                                  index]
                                                              .itemAName
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline5),
                                                      Text(
                                                        controller
                                                                .categoriesLis[
                                                                    index].itemDetails[0]
                                                                .itemPrice
                                                                .toString() +
                                                            'R.S'.tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: heightApp * 0.01,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.044,
                                                        //width: widthApp * 0.28,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: Theme.of(
                                                                    context)
                                                                .primaryColorDark,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                          onPressed: () {
                                                            Get.toNamed(
                                                                Routes
                                                                    .EDIT_SERVICES,
                                                                arguments: [
                                                                  controller
                                                                      .categoriesLis[
                                                                          index]
                                                                      .itemID
                                                                      
                                                                ]);
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              "Edit".tr,
                                                              style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColorLight,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "There are no services for this activity".tr,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ));
                }),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: FloatingActionButton(
                onPressed: () {
                  Get.offAllNamed(Routes.ADD_SERVICES, arguments: [
                    controller.companyId,
                    controller.itemtypeid,
                  ]);
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: kwhite,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.add,
                      color: kwhite,
                      size: 30.0,
                    ),
                  ),
                ),
                elevation: 5,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startDocked),
      ),
    );
  }
}
