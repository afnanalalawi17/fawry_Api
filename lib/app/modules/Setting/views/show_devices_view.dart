import 'dart:io';
import 'dart:ui';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Services/Login_Stat_Controller.dart';
import 'package:fawry_app/app/lang/lang_core.dart';
import 'package:fawry_app/app/modules/Detials_Report/controllers/Item.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:fawry_app/app/theme/themes_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/show_devices_controller.dart';

class ShowDevicesView extends GetView<ShowDevicesController> {
  final lang = Get.put(AppLanguageController());
  final loginState = Get.put(LoginStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Settings".tr,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: GetBuilder<ShowDevicesController>(
          init: ShowDevicesController(),
          initState: (_) {},
          builder: (_) {
            return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Container(
                    child: Column(children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(59, 59, 152, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Profile personly".tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.PROFILE);
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Theme.of(context)
                                              .primaryColorDark)),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //      Get.toNamed(Routes.FAVORITE);
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(bottom: 20),
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).primaryColorLight,
                        //       borderRadius: BorderRadius.circular(12),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Color.fromRGBO(59, 59, 152, 0.2),
                        //           blurRadius: 30,
                        //           offset: Offset(0, 4),
                        //         ),
                        //       ],
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             "Favorite".tr,
                        //             style: TextStyle(
                        //                 fontSize: 18,
                        //                 fontWeight: FontWeight.w700,
                        //                 color: Theme.of(context).primaryColorDark),
                        //           ),
                        //           IconButton(
                        //               onPressed: () { Get.toNamed(Routes.FAVORITE);},
                        //               icon: Icon(
                        //                 Icons.arrow_forward_ios_rounded,
                        //                 color: Theme.of(context).primaryColorDark,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        //  ),
                        // GestureDetector(
                        //   onTap: () {
                        //    Get.toNamed(Routes.ARCHIVES);
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(bottom: 20),
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).primaryColorLight,
                        //       borderRadius: BorderRadius.circular(12),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Color.fromRGBO(59, 59, 152, 0.2),
                        //           blurRadius: 30,
                        //           offset: Offset(0, 4),
                        //         ),
                        //       ],
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             "archives".tr,
                        //             style: TextStyle(
                        //                 fontSize: 18,
                        //                 fontWeight: FontWeight.w700,
                        //                 color: Theme.of(context).primaryColorDark),
                        //           ),
                        //           IconButton(
                        //               onPressed: () {
                        //               Get.toNamed(Routes.ARCHIVES);
                        //               },
                        //               icon: Icon(Icons.arrow_forward_ios_rounded,
                        //                   color: Theme.of(context).primaryColorDark)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        GestureDetector(
                          onTap: () async {
                            String url =
                                'https://privacy-policy.fawry-invoices.com';
                            await launch(url,
                                forceSafariVC: false, forceWebView: true);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(59, 59, 152, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Terms and Conditions".tr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        String url =
                                            'https://privacy-policy.fawry-invoices.com';
                                        await launch(url,
                                            forceSafariVC: false,
                                            forceWebView: true);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //  GestureDetector(
                        //   onTap: () {
                        //   Get.toNamed(Routes.REPORT);
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(bottom: 20),
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).primaryColorLight,
                        //       borderRadius: BorderRadius.circular(12),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Color.fromRGBO(59, 59, 152, 0.2),
                        //           blurRadius: 30,
                        //           offset: Offset(0, 4),
                        //         ),
                        //       ],
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'Reports'.tr,
                        //             style: TextStyle(
                        //                 fontSize: 18,
                        //                 fontWeight: FontWeight.w700,
                        //                 color: Theme.of(context).primaryColorDark),
                        //           ),
                        //           IconButton(
                        //               onPressed: () {  Get.toNamed(Routes.REPORT);},
                        //               icon: Icon(Icons.arrow_forward_ios_rounded,
                        //                   color: Theme.of(context).primaryColorDark)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //  GestureDetector(
                        //   onTap: () {
                        //     Get.toNamed(Routes.DELETE_COMPANY);
                        //   },
                        //   child: Container(
                        //     margin: EdgeInsets.only(bottom: 20),
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).primaryColorLight,
                        //       borderRadius: BorderRadius.circular(12),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Color.fromRGBO(59, 59, 152, 0.2),
                        //           blurRadius: 30,
                        //           offset: Offset(0, 4),
                        //         ),
                        //       ],
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             "Delete Company".tr,
                        //             style: TextStyle(
                        //                 fontSize: 18,
                        //                 fontWeight: FontWeight.w700,
                        //                 color: Theme.of(context).primaryColorDark),
                        //           ),
                        //           IconButton(
                        //               onPressed: () {
                        //                 Get.toNamed(Routes.DELETE_COMPANY);
                        //               },
                        //               icon: Icon(Icons.arrow_forward_ios_rounded,
                        //                   color: Theme.of(context).primaryColorDark)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  on(int index) {
                                    controller.selectedIndex = index;
                                    controller.update();
                                  }

                                  return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      content: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, top: 8),
                                        child: Text(
                                          "Choose the color of the application you want to continue with"
                                              .tr,
                                        ),
                                      ),
                                      actionsPadding:
                                          const EdgeInsets.only(bottom: 25),
                                      actions: [
                                        GetBuilder<ShowDevicesController>(
                                            init: ShowDevicesController(),
                                            initState: (_) {},
                                            builder: (_) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, left: 10),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            ThemeHelper
                                                                .saveThemeToBox(
                                                                    'th1');
                                                            ThemeHelper
                                                                .switchTheme(
                                                                    'th1');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              height: 33,
                                                              width: 33,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: kblack,
                                                                border: Border.all(
                                                                    color:
                                                                        kwhite,
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                    blurRadius:
                                                                        30,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              ))),
                                                      InkWell(
                                                          onTap: () {
                                                            ThemeHelper
                                                                .saveThemeToBox(
                                                                    'th2');
                                                            ThemeHelper
                                                                .switchTheme(
                                                                    'th2');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              height: 33,
                                                              width: 33,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF3B3B98),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                    blurRadius:
                                                                        30,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              ))),
                                                      InkWell(
                                                          onTap: () {
                                                            ThemeHelper
                                                                .saveThemeToBox(
                                                                    'th3');
                                                            ThemeHelper
                                                                .switchTheme(
                                                                    'th3');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              height: 33,
                                                              width: 33,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF008080),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                    blurRadius:
                                                                        30,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              ))),
                                                      InkWell(
                                                          onTap: () {
                                                            ThemeHelper
                                                                .saveThemeToBox(
                                                                    'th4');
                                                            ThemeHelper
                                                                .switchTheme(
                                                                    'th4');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              height: 33,
                                                              width: 33,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff663399),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                    blurRadius:
                                                                        30,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              ))),
                                                      InkWell(
                                                          onTap: () {
                                                            ThemeHelper
                                                                .saveThemeToBox(
                                                                    'th5');
                                                            ThemeHelper
                                                                .switchTheme(
                                                                    'th5');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              height: 33,
                                                              width: 33,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xffDAA520),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                    blurRadius:
                                                                        30,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              ))),
                                                      InkWell(
                                                          onTap: () {
                                                            ThemeHelper
                                                                .saveThemeToBox(
                                                                    'th6');
                                                            ThemeHelper
                                                                .switchTheme(
                                                                    'th6');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              height: 33,
                                                              width: 33,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff5d1049),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                    blurRadius:
                                                                        30,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              )))
                                                    ]),
                                              );
                                            })
                                      ]);
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(59, 59, 152, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "appearance".tr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              on(int index) {
                                                controller.selectedIndex =
                                                    index;
                                                controller.update();
                                              }

                                              return AlertDialog(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      12.0))),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8,
                                                            right: 8,
                                                            top: 8),
                                                    child: Text(
                                                        "Choose the color of the application you want to continue with"
                                                            .tr),
                                                  ),
                                                  actionsPadding:
                                                      const EdgeInsets.only(
                                                          bottom: 25),
                                                  actions: [
                                                    GetBuilder<
                                                            ShowDevicesController>(
                                                        init:
                                                            ShowDevicesController(),
                                                        initState: (_) {},
                                                        builder: (_) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 10,
                                                                    left: 10),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        ThemeHelper.saveThemeToBox(
                                                                            'th1');
                                                                        ThemeHelper.switchTheme(
                                                                            'th1');
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 33,
                                                                          width: 33,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                kblack,
                                                                            border:
                                                                                Border.all(color: kwhite, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color.fromRGBO(59, 59, 152, 0.2),
                                                                                blurRadius: 30,
                                                                                offset: Offset(0, 4),
                                                                              ),
                                                                            ],
                                                                          ))),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        ThemeHelper.saveThemeToBox(
                                                                            'th2');
                                                                        ThemeHelper.switchTheme(
                                                                            'th2');
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 33,
                                                                          width: 33,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xFF3B3B98),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color.fromRGBO(59, 59, 152, 0.2),
                                                                                blurRadius: 30,
                                                                                offset: Offset(0, 4),
                                                                              ),
                                                                            ],
                                                                          ))),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        ThemeHelper.saveThemeToBox(
                                                                            'th3');
                                                                        ThemeHelper.switchTheme(
                                                                            'th3');
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 33,
                                                                          width: 33,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xFF008080),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color.fromRGBO(59, 59, 152, 0.2),
                                                                                blurRadius: 30,
                                                                                offset: Offset(0, 4),
                                                                              ),
                                                                            ],
                                                                          ))),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        ThemeHelper.saveThemeToBox(
                                                                            'th4');
                                                                        ThemeHelper.switchTheme(
                                                                            'th4');
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 33,
                                                                          width: 33,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xff663399),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color.fromRGBO(59, 59, 152, 0.2),
                                                                                blurRadius: 30,
                                                                                offset: Offset(0, 4),
                                                                              ),
                                                                            ],
                                                                          ))),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        ThemeHelper.saveThemeToBox(
                                                                            'th5');
                                                                        ThemeHelper.switchTheme(
                                                                            'th5');
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 33,
                                                                          width: 33,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffDAA520),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color.fromRGBO(59, 59, 152, 0.2),
                                                                                blurRadius: 30,
                                                                                offset: Offset(0, 4),
                                                                              ),
                                                                            ],
                                                                          ))),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        ThemeHelper.saveThemeToBox(
                                                                            'th6');
                                                                        ThemeHelper.switchTheme(
                                                                            'th6');
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 33,
                                                                          width: 33,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xff5d1049),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color.fromRGBO(59, 59, 152, 0.2),
                                                                                blurRadius: 30,
                                                                                offset: Offset(0, 4),
                                                                              ),
                                                                            ],
                                                                          )))
                                                                ]),
                                                          );
                                                        })
                                                  ]);
                                            });
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Theme.of(context)
                                              .primaryColorDark)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Choose the language of the application you want to continue with"
                                              .tr),
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actionsPadding:
                                        const EdgeInsets.only(bottom: 25),
                                    actions: <Widget>[
                                      GetBuilder<ShowDevicesController>(
                                          init: ShowDevicesController(),
                                          initState: (_) {},
                                          builder: (_) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      // controller.isSelected = true;
                                                      // controller.update();
                                                      // print(controller.isSelected);
                                                      lang.changeLanguage('ar');
                                                      Get.updateLocale(
                                                          Locale('ar'));
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height: 120,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorDark),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    59,
                                                                    59,
                                                                    152,
                                                                    0.2),
                                                            blurRadius: 30,
                                                            offset:
                                                                Offset(0, 4),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                child: Image.asset(
                                                                    "assets/images/Flag_of_Saudi_Arabia.png")),
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              "العربية",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: widthApp * 0.03,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    // controller.isSelected = false;
                                                    // controller.update();
                                                    // print(controller.isSelected);
                                                    lang.changeLanguage('en');
                                                    Get.updateLocale(
                                                        Locale('en'));
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 120,
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                              59, 59, 152, 0.2),
                                                          blurRadius: 30,
                                                          offset: Offset(0, 4),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/Flag_of_Great_Britain.jpg",
                                                              )),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            "English",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(59, 59, 152, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "language".tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                scrollable: true,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    12.0))),
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      "Choose the language of the application you want to continue with"
                                                          .tr),
                                                ),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actionsPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 25),
                                                actions: <Widget>[
                                                  GetBuilder<
                                                          ShowDevicesController>(
                                                      init:
                                                          ShowDevicesController(),
                                                      initState: (_) {},
                                                      builder: (_) {
                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  controller
                                                                          .isSelected =
                                                                      true;
                                                                  controller
                                                                      .update();
                                                                  print(controller
                                                                      .isSelected);
                                                                  lang.changeLanguage(
                                                                      'ar');
                                                                  Get.updateLocale(
                                                                      Locale(
                                                                          'ar'));
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 120,
                                                                  width: 120,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    border: Border.all(
                                                                        color: controller.isSelected
                                                                            ? Theme.of(context).primaryColor
                                                                            : kwhite),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color.fromRGBO(
                                                                            59,
                                                                            59,
                                                                            152,
                                                                            0.2),
                                                                        blurRadius:
                                                                            30,
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                            child: Image.asset("assets/images/Flag_of_Saudi_Arabia.png")),
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Text(
                                                                          "العربية",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Theme.of(context).primaryColor),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            SizedBox(
                                                              width: widthApp *
                                                                  0.03,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                        .isSelected =
                                                                    false;
                                                                controller
                                                                    .update();
                                                                print(controller
                                                                    .isSelected);
                                                                lang.changeLanguage(
                                                                    'en');
                                                                Get.updateLocale(
                                                                    Locale(
                                                                        'en'));
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                height: 120,
                                                                width: 120,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  border: Border.all(
                                                                      color: controller
                                                                              .isSelected
                                                                          ? kwhite
                                                                          : Theme.of(context)
                                                                              .primaryColor),
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          59,
                                                                          59,
                                                                          152,
                                                                          0.2),
                                                                      blurRadius:
                                                                          30,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              4),
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(12),
                                                                          child: Image.asset(
                                                                            "assets/images/Flag_of_Great_Britain.jpg",
                                                                          )),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        "English",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Theme.of(context).primaryColor),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      })
                                                ],
                                              );
                                            });
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Theme.of(context)
                                              .primaryColorDark)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            // showAdaptiveActionSheet(
                            //               context: context,
                            //               actions: <BottomSheetAction>[
                            //                 BottomSheetAction(
                            //                     title: Text(
                            //                       '+966566097988'.tr,
                            //                       //  / style: kBlack_18r,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     onPressed: () {
                            //                       FlutterPhoneDirectCaller.callNumber(
                            //                           '0566097988');
                            //                     }),
                            //               ],
                            //               cancelAction: CancelAction(
                            //                   title: Text(
                            //                 'cancel'.tr,
                            //                 style: TextStyle(color: Colors.red),
                            //               )),
                            //             );
                            var whatsapp = "+966566097988";
                            var whatsappURl_android = "whatsapp://send?phone=" +
                                whatsapp +
                                "&text=hello";
                            var whatappURL_ios =
                                "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
                            if (Platform.isIOS) {
                              // for iOS phone only
                              if (await canLaunch(whatappURL_ios)) {
                                await launch(whatappURL_ios,
                                    forceSafariVC: false);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            new Text("whatsapp no installed")));
                              }
                            } else {
                              // android , web
                              if (await canLaunch(whatsappURl_android)) {
                                await launch(whatsappURl_android);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            new Text("whatsapp no installed")));
                              }
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(59, 59, 152, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Contact us".tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        var whatsapp = "+966566097988";
                                        var text = '';
                                        var whatsappURl_android =
                                            "whatsapp://send?phone=" +
                                                whatsapp +
                                                "&text=$text";
                                        var whatappURL_ios =
                                            "https://wa.me/$whatsapp?text=${Uri.parse(text)}";
                                        if (Platform.isIOS) {
                                          // for iOS phone only
                                          if (await canLaunch(whatappURL_ios)) {
                                            await launch(whatappURL_ios,
                                                forceSafariVC: false);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: new Text(
                                                        "whatsapp no installed")));
                                          }
                                        } else {
                                          // android , web
                                          if (await canLaunch(
                                              whatsappURl_android)) {
                                            await launch(whatsappURl_android);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: new Text(
                                                        "whatsapp no installed")));
                                          }
                                        }

                                        // showAdaptiveActionSheet(
                                        //   context: context,
                                        //   actions: <BottomSheetAction>[
                                        //     BottomSheetAction(
                                        //         title: Text(
                                        //           '+966566097988'.tr,
                                        //           //  / style: kBlack_18r,
                                        //           textAlign: TextAlign.center,
                                        //         ),
                                        //         onPressed: () {
                                        //           FlutterPhoneDirectCaller.callNumber(
                                        //               '0566097988');
                                        //         }),
                                        //   ],
                                        //   cancelAction: CancelAction(
                                        //       title: Text(
                                        //     'cancel'.tr,
                                        //     style: TextStyle(color: Colors.red),
                                        //   )),
                                        // );
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Theme.of(context)
                                              .primaryColorDark)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: const EdgeInsets.only(bottom: 20),
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).primaryColorLight,
                        //     borderRadius: BorderRadius.circular(12),
                        //     boxShadow: const [
                        //       BoxShadow(
                        //         color: Color.fromRGBO(59, 59, 152, 0.2),
                        //         blurRadius: 30,
                        //         offset: Offset(0, 4),
                        //       ),
                        //     ],
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 10, vertical: 10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text(
                        //           "common questions".tr,
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w700,
                        //               color: Theme.of(context).primaryColorDark),
                        //         ),
                        //         IconButton(
                        //             onPressed: () {},
                        //             icon: Icon(Icons.arrow_forward_ios_rounded,
                        //                 color: Theme.of(context).primaryColorDark)),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Are you sure about the logout process?"
                                              .tr),
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          "yes".tr,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () async {
                                          GetStorage().remove('Token');
                                          loginState
                                              .changeLoginState('notLogin');
// GetStorage().write('onBoardin', 0);
                                          ThemeHelper.saveThemeToBox('th2');
                                          ThemeHelper.switchTheme('th2');
                                          Get.toNamed(Routes.LOGIN);
                                        },
                                      ),
                                      TextButton(
                                        child: Text("cancel".tr),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(59, 59, 152, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 18),
                              child: Center(
                                child: Text(
                                  "sign out".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "All rights reserved to ".tr,
                        style: TextStyle(
                          fontSize: lang.appLocale == 'en'
                          ?14
                          :16,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Hypertech'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Theme.of(context).primaryColorDark,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async{
                                        String url =
                                                'https://hypertech-sa.com';
                                            await launch(url,
                                                forceSafariVC: false,
                                                forceWebView: true);
                                }),TextSpan(
                              text: ' 2022'.tr,
                              style: TextStyle(
                               fontSize: lang.appLocale == 'en'
                          ?14
                          :16,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColorDark,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {})
                        ])),
                  ),SizedBox(height: heightApp*0.04,)
                ])));
          }),
    );
  }
}
