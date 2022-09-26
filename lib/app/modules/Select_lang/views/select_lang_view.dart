import 'dart:ui';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_lang_controller.dart';

class SelectLangView extends GetView<SelectLangController> {
  final lang = Get.put(AppLanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
            ),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: 42,
              width: 280,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsetsDirectional.only(
                    top: 5,
                    start: 7,
                    bottom: 5,
                    end: 2,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  alignment: Alignment.center,
                  side: BorderSide(
                    width: 1,
                  
                  ),
                  primary: kwhite,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  showAdaptiveActionSheet(
                    context: context,
                    actions: <BottomSheetAction>[
                      BottomSheetAction(
                          title: Text(
                            'عربي'.tr,
                            //  / style: kBlack_18r,
                            textAlign: TextAlign.center,
                          ),
                          onPressed: (context) {
                            lang.changeLanguage('ar');
                            Get.updateLocale(Locale('ar'));
                            Get.toNamed(Routes.BOARDING);
                          }),
                      BottomSheetAction(
                          title: Text(
                            'English'.tr,
                            textAlign: TextAlign.center,
                          ),
                          onPressed: (context) {
                            lang.changeLanguage('en');
                            Get.updateLocale(Locale('en'));
                            Get.toNamed(Routes.BOARDING);
                          }),
                    ],
                    cancelAction: CancelAction(
                        title: Text(
                      'cancel'.tr,
                      style: TextStyle(color: Colors.red),
                    )),
                  );
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select the language".tr,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor
                        ),
                      ),
                      Icon(
                        Icons.language,
                        color: Theme.of(context).primaryColor,
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
