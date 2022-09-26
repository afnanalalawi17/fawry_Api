import 'dart:async';
import 'dart:ui';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/RefreshWidget.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Services/Subscription.dart';
import 'package:fawry_app/app/data/Services/get_payment.dart';
import 'package:fawry_app/app/data/Services/request_confirm_phone.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:translator/translator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/activitys_controller.dart';

class ActivitysView extends GetView<ActivitysController> {
  @override
  final controller = Get.put(ActivitysController());
  final lang = Get.put(AppLanguageController());
  List<int> data = [];

  final translator = GoogleTranslator();
  var translation;

  var between;
  BuildContext? context1;
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetBuilder<ActivitysController>(
          init: ActivitysController(),
          initState: (_) {},
          builder: (_) {
            return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  toolbarHeight: 140,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Activities".tr,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Includes all activities".tr,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),

                      controller.confirmphone == false
                          ? Column(
                              children: [
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final _res =
                                        await StartRequestConfirmMobileNo(
                                            controller.email, controller.token);
                                    Get.toNamed(Routes.PHONE,
                                        arguments: [controller.email]);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(.40),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.warning_amber_rounded,
                                              color: Colors.black,
                                              size: 28,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              'Please confirm your phone number'
                                                  .tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                              ],
                            )
                          : Container(),

//                controller.categoriesLis.isNotEmpty
//                           ? controller.check
//                               ? Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 10),
//                                   child: Container(
//                                     width: double.infinity,
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       color: Color(0xffE22D2D).withOpacity(.40),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.warning_amber_rounded,
//                                           color: Colors.red,
//                                           size: 28,
//                                         ),
//                                         const SizedBox(width: 5),
//                                         Text(
//                                           'Activity fee must be paid before printing'
//                                               .tr,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headline4,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
// :Container()
// :Container()
                    ],
                  ),
                ),
                body: Obx(() => controller.isLoading.value == true
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.32,
                            ),
                            Custom_ProgressIndicator(),
                          ],
                        ),
                      )
                    : controller.CompanyList.isNotEmpty
                        ? RefreshWidget(
                            keyRefresh: controller.keyRefresh,
                            onRefresh: controller.loadList,
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: heightApp * 0.02,
                                  );
                                },
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20),
                                shrinkWrap: true,
                                primary: false,
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.CompanyList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(59, 59, 152, 0.2),
                                          blurRadius: 30,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  if (controller
                                                          .CompanyList[index]
                                                          .subscription[0]
                                                          .subscriptionTypeID ==
                                                      1)
                                                    GestureDetector(
                                                      onTap: () async {
                                                        var between = Jiffy(
                                                                controller
                                                                    .CompanyList[
                                                                        index]
                                                                    .subscription[
                                                                        0]
                                                                    .endDate
                                                                    .toString(),
                                                                "dd/MM/yyyy")
                                                            .fromNow();
                                                        print(between);
                                                        var i = between;
                                                        var translation = await lang
                                                                    .appLocale ==
                                                                'en'
                                                            ? between
                                                            : translator
                                                                .translate(
                                                                    between,
                                                                    from: 'en',
                                                                    to: 'ar');
                                                        Get.rawSnackbar(
                                                          duration: Duration(
                                                              seconds: 5),
                                                          snackStyle: SnackStyle
                                                              .FLOATING,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          borderRadius: 15,
                                                          messageText: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text: between
                                                                      .contains(
                                                                          'ago')
                                                                  ? "${'Trial period has ended'.tr} ${translation} "
                                                                  : "${'Trial period ends'.tr} $translation ",
                                                              style: DefaultTextStyle
                                                                      .of(context)
                                                                  .style,
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  controller.dialogContext = context;
                                                                                  return AlertDialog(
                                                                                    scrollable: true,
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                    content: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.topRight,
                                                                                          child: IconButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              size: 33,
                                                                                              color: Color(0xFF3B3B98),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Image.asset('assets/images/failed.png'),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        Text(
                                                                                          'Sorry'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.01,
                                                                                        ),
                                                                                        Text(
                                                                                          'Please pay the subscription fee of 300 R.S'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: widthApp * 0.33,
                                                                                          height: heightApp * 0.044,
                                                                                          child: ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Theme.of(context).primaryColor,
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                try {
                                                                                                  final _res = await StartSubscription(controller.CompanyList[index].companyID, 2, controller.token);

                                                                                                  controller.companyID = controller.CompanyList[index].companyID;
                                                                                                  var items = await GetPayment(controller.CompanyList[index].companyID, controller.token);
                                                                                                  controller.url.value = items.data!;
                                                                                                  print(controller.url.value.toString());
                                                                                                  controller.update();

                                                                                                  Completer<WebViewController> _controller = Completer<WebViewController>();
                                                                                                  showDialog(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context1) {
                                                                                                        controller.dialogContext = context1;
                                                                                                        return AlertDialog(
                                                                                                          scrollable: true,
                                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                          content: Column(
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: Alignment.topRight,
                                                                                                                child: IconButton(
                                                                                                                  onPressed: () {
                                                                                                                    Navigator.of(context).pop();
                                                                                                                    Navigator.of(context1).pop();
                                                                                                                    print(controller.url.value);
                                                                                                                  },
                                                                                                                  icon: const Icon(
                                                                                                                    Icons.close,
                                                                                                                    size: 33,
                                                                                                                    color: Color(0xFF3B3B98),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Obx(() => Container(
                                                                                                                    height: 500,
                                                                                                                    width: 400,
                                                                                                                    child: WebView(
                                                                                                                      onWebViewCreated: (controller) {
                                                                                                                        _controller.complete(controller);
                                                                                                                      },
                                                                                                                      zoomEnabled: false,
                                                                                                                      debuggingEnabled: true,
                                                                                                                      initialUrl: controller.url.value.toString(),
                                                                                                                      javascriptMode: JavascriptMode.unrestricted,
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      });
                                                                                                } catch (e) {
                                                                                                  if (Get.isDialogOpen == true) Get.back();
                                                                                                }
                                                                                              },
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  "Pay".tr,
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w700,
                                                                                                    color: kwhite,
                                                                                                  ),
                                                                                                ),
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          },
                                                                    text:
                                                                        'pay now'
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // TextSpan(text: ' world!'),
                                                              ],
                                                            ),
                                                          ),
                                                          isDismissible: true,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .bounceInOut,
                                                          barBlur: 50,
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.warning_rounded,
                                                        color: Colors
                                                            .yellow.shade800,
                                                      ),
                                                    )
                                                  else if (controller
                                                          .CompanyList[index]
                                                          .subscription[0]
                                                          .subscriptionTypeID ==
                                                      3)
                                                    GestureDetector(
                                                      onTap: () async {
                                                        var between = Jiffy(
                                                                controller
                                                                    .CompanyList[
                                                                        index]
                                                                    .subscription[
                                                                        0]
                                                                    .endDate
                                                                    .toString(),
                                                                "dd/MM/yyyy")
                                                            .fromNow();
                                                        var i = between;
                                                        var translation = await lang
                                                                    .appLocale ==
                                                                'en'
                                                            ? between
                                                            : translator
                                                                .translate(
                                                                    between,
                                                                    from: 'en',
                                                                    to: 'ar');
                                                        Get.rawSnackbar(
                                                          duration: Duration(
                                                              seconds: 5),
                                                          snackStyle: SnackStyle
                                                              .FLOATING,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          borderRadius: 15,
                                                          messageText: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text: between
                                                                      .contains(
                                                                          'ago')
                                                                  ? "${'The subscription voucher has expired'.tr} $translation "
                                                                  : "${'Subscription voucher expires'.tr} $translation ",
                                                              style: DefaultTextStyle
                                                                      .of(context)
                                                                  .style,
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return AlertDialog(
                                                                                    scrollable: true,
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                    content: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.topRight,
                                                                                          child: IconButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              size: 33,
                                                                                              color: Color(0xFF3B3B98),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Image.asset('assets/images/failed.png'),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        Text(
                                                                                          'Sorry'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.01,
                                                                                        ),
                                                                                        Text(
                                                                                          'Please pay the subscription fee of 300 R.S'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: widthApp * 0.33,
                                                                                          height: heightApp * 0.044,
                                                                                          child: ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Theme.of(context).primaryColor,
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                print(GetStorage().read("activityID"));

                                                                                                controller.companyID = controller.CompanyList[index].companyID;
                                                                                                try {
                                                                                                  final _res = await StartSubscription(controller.CompanyList[index].companyID, 2, controller.token);

                                                                                                  var items = await GetPayment(controller.CompanyList[index].companyID, controller.token);
                                                                                                  controller.url.value = items.data!;
                                                                                                  controller.update();

                                                                                                  Get.back();

                                                                                                  Completer<WebViewController> _controller = Completer<WebViewController>();

                                                                                                  showDialog(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context) {
                                                                                                        controller.dialogContext = context;
                                                                                                        return AlertDialog(
                                                                                                          scrollable: true,
                                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                          content: Column(
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: Alignment.topRight,
                                                                                                                child: IconButton(
                                                                                                                  onPressed: () {
                                                                                                                    Navigator.of(context).pop();
                                                                                                                    print(controller.url.value);
                                                                                                                  },
                                                                                                                  icon: const Icon(
                                                                                                                    Icons.close,
                                                                                                                    size: 33,
                                                                                                                    color: Color(0xFF3B3B98),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Obx(() => Container(
                                                                                                                    height: 500,
                                                                                                                    width: 400,
                                                                                                                    child: WebView(
                                                                                                                      onWebViewCreated: (controller) {
                                                                                                                        _controller.complete(controller);
                                                                                                                      },
                                                                                                                      zoomEnabled: false,
                                                                                                                      debuggingEnabled: true,
                                                                                                                      initialUrl: controller.url.value.toString(),
                                                                                                                      javascriptMode: JavascriptMode.unrestricted,
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      });
                                                                                                } catch (e) {
                                                                                                  if (Get.isDialogOpen == true) Get.back();
                                                                                                }
                                                                                              },
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  "Pay".tr,
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w700,
                                                                                                    color: kwhite,
                                                                                                  ),
                                                                                                ),
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          },
                                                                    text:
                                                                        'pay now'
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // TextSpan(text: ' world!'),
                                                              ],
                                                            ),
                                                          ),
                                                          isDismissible: true,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .bounceInOut,
                                                          barBlur: 50,
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.discount_rounded,
                                                        color: Colors.green,
                                                      ),
                                                    )

// ignore: unrelated_type_equality_checks
                                                  else if (controller
                                                          .CompanyList[index]
                                                          .subscription[0]
                                                          .subscriptionTypeID ==
                                                      4)
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.rawSnackbar(
                                                          duration: Duration(
                                                              seconds: 5),
                                                          snackStyle: SnackStyle
                                                              .FLOATING,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          borderRadius: 15,
                                                          messageText: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text:
                                                                  "Subscription expired please"
                                                                      .tr,
                                                              style: DefaultTextStyle
                                                                      .of(context)
                                                                  .style,
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return AlertDialog(
                                                                                    scrollable: true,
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                    content: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.topRight,
                                                                                          child: IconButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              size: 33,
                                                                                              color: Color(0xFF3B3B98),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Image.asset('assets/images/failed.png'),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        Text(
                                                                                          'Sorry'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.01,
                                                                                        ),
                                                                                        Text(
                                                                                          'Please pay the subscription fee of 300 R.S'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: widthApp * 0.33,
                                                                                          height: heightApp * 0.044,
                                                                                          child: ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Theme.of(context).primaryColor,
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                // print(GetStorage().read("activityID"));
                                                                                                        final _res = await StartSubscription(controller.CompanyList[index].companyID,2 ,controller.token);


                                                                                                controller.companyID = controller.CompanyList[index].companyID;

                                                                                                try {
                                                                                                  var items = await GetPayment(controller.CompanyList[index].companyID, controller.token);
                                                                                                  controller.url.value = items.data!;
                                                                                                  print("^^^^^^^6");
                                                                                                  print(controller.url.value.toString());
                                                                                                  controller.update();

                                                                                                  Get.back();

                                                                                                  Completer<WebViewController> _controller = Completer<WebViewController>();

                                                                                                  showDialog(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context) {
                                                                                                        controller.dialogContext = context;
                                                                                                        return AlertDialog(
                                                                                                          scrollable: true,
                                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                          content: Column(
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: Alignment.topRight,
                                                                                                                child: IconButton(
                                                                                                                  onPressed: () {
                                                                                                                    Navigator.of(context).pop();
                                                                                                                    print(controller.url.value);
                                                                                                                  },
                                                                                                                  icon: const Icon(
                                                                                                                    Icons.close,
                                                                                                                    size: 33,
                                                                                                                    color: Color(0xFF3B3B98),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Obx(() => Container(
                                                                                                                    height: 500,
                                                                                                                    width: 400,
                                                                                                                    child: WebView(
                                                                                                                      onWebViewCreated: (controller) {
                                                                                                                        _controller.complete(controller);
                                                                                                                      },
                                                                                                                      zoomEnabled: false,
                                                                                                                      debuggingEnabled: true,
                                                                                                                      initialUrl: controller.url.value.toString(),
                                                                                                                      javascriptMode: JavascriptMode.unrestricted,
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      });
                                                                                                } catch (e) {
                                                                                                  if (Get.isDialogOpen == true) Get.back();
                                                                                                }
                                                                                              },
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  "Pay".tr,
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w700,
                                                                                                    color: kwhite,
                                                                                                  ),
                                                                                                ),
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          },
                                                                    text:
                                                                        'pay now'
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // TextSpan(text: ' world!'),
                                                              ],
                                                            ),
                                                          ),
                                                          isDismissible: true,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .bounceInOut,
                                                          barBlur: 50,
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.warning_rounded,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  SizedBox(
                                                    width: widthApp * 0.01,
                                                  ),
                                                  Text(
                                                      lang.appLocale == 'en'
                                                          ? controller
                                                              .CompanyList[
                                                                  index]
                                                              .companyEName
                                                              .toString()
                                                          : controller
                                                              .CompanyList[
                                                                  index]
                                                              .companyAName
                                                              .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: heightApp * 0.044,
                                              //  width: widthApp * 0.12,
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Theme.of(context)
                                                      .primaryColorDark,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                                onPressed: () async {
                                                  controller
                                                              .CompanyList[
                                                                  index]
                                                              .subscription[0]
                                                              .isActive ==
                                                          false
                                                      ? Get.rawSnackbar(
                                                          duration: Duration(
                                                              seconds: 5),
                                                          snackStyle: SnackStyle
                                                              .FLOATING,
                                                          backgroundColor:
                                                              Colors.red,
                                                          borderRadius: 15,
                                                          messageText: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text:
                                                                  "Subscription expired please"
                                                                      .tr,
                                                              style: DefaultTextStyle
                                                                      .of(context)
                                                                  .style,
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return AlertDialog(
                                                                                    scrollable: true,
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                    content: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.topRight,
                                                                                          child: IconButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              size: 33,
                                                                                              color: Color(0xFF3B3B98),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Image.asset('assets/images/failed.png'),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        Text(
                                                                                          'Sorry'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.01,
                                                                                        ),
                                                                                        Text(
                                                                                          'Please pay the subscription fee of 300 R.S'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: widthApp * 0.33,
                                                                                          height: heightApp * 0.044,
                                                                                          child: ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Theme.of(context).primaryColor,
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                // print(GetStorage().read("activityID"));

                                                                                                controller.companyID = controller.CompanyList[index].companyID;

                                                                                                try {
                                                                                                  var items = await GetPayment(controller.CompanyList[index].companyID, controller.token);
                                                                                                  controller.url.value = items.data!;
                                                                                                  print("^^^^^^^6");
                                                                                                  print(controller.url.value.toString());
                                                                                                  controller.update();

                                                                                                  Get.back();

                                                                                                  Completer<WebViewController> _controller = Completer<WebViewController>();

                                                                                                  showDialog(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context) {
                                                                                                        controller.dialogContext = context;
                                                                                                        return AlertDialog(
                                                                                                          scrollable: true,
                                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                          content: Column(
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: Alignment.topRight,
                                                                                                                child: IconButton(
                                                                                                                  onPressed: () {
                                                                                                                    Navigator.of(context).pop();
                                                                                                                    print(controller.url.value);
                                                                                                                  },
                                                                                                                  icon: const Icon(
                                                                                                                    Icons.close,
                                                                                                                    size: 33,
                                                                                                                    color: Color(0xFF3B3B98),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Obx(() => Container(
                                                                                                                    height: 500,
                                                                                                                    width: 400,
                                                                                                                    child: WebView(
                                                                                                                      onWebViewCreated: (controller) {
                                                                                                                        _controller.complete(controller);
                                                                                                                      },
                                                                                                                      zoomEnabled: false,
                                                                                                                      debuggingEnabled: true,
                                                                                                                      initialUrl: controller.url.value.toString(),
                                                                                                                      javascriptMode: JavascriptMode.unrestricted,
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      });
                                                                                                } catch (e) {
                                                                                                  if (Get.isDialogOpen == true) Get.back();
                                                                                                }
                                                                                              },
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  "Pay".tr,
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w700,
                                                                                                    color: kwhite,
                                                                                                  ),
                                                                                                ),
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          },
                                                                    text:
                                                                        ' pay now'
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // TextSpan(text: ' world!'),
                                                              ],
                                                            ),
                                                          ),
                                                          isDismissible: true,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .bounceInOut,
                                                          barBlur: 50,
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        )
                                                      :

                                                      // controller.CompanyList[index].subscription[0].endDate > DateTime.now()
                                                      await Get.toNamed(
                                                          Routes.EDIT_ACTIVITY,
                                                          // arguments: [
                                                          //   controller
                                                          //       .CompanyList[index]
                                                          //       .companyID
                                                          // ]
                                                          //
                                                        );
                                                },
                                                icon: Icon(
                                                  Icons.edit_note_rounded,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  size: 30,
                                                ),
                                                label: Center(
                                                  child: Text(
                                                    "Edit".tr,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.044,
                                              //  width: widthApp * 0.12,
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Theme.of(context)
                                                      .primaryColorDark,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                                onPressed: () async {
                                                  print(
                                                      "***********companyID***********");
                                                  print(controller
                                                      .CompanyList[index]
                                                      .companyID
                                                      .toString());

                                                  controller
                                                              .CompanyList[
                                                                  index]
                                                              .subscription[0]
                                                              .isActive ==
                                                          false
                                                      ? Get.rawSnackbar(
                                                          duration: Duration(
                                                              seconds: 5),
                                                          snackStyle: SnackStyle
                                                              .FLOATING,
                                                          backgroundColor:
                                                              Colors.red,
                                                          borderRadius: 15,
                                                          messageText: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text:
                                                                  "Subscription expired please"
                                                                      .tr,
                                                              style: DefaultTextStyle
                                                                      .of(context)
                                                                  .style,
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return AlertDialog(
                                                                                    scrollable: true,
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                    content: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.topRight,
                                                                                          child: IconButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              size: 33,
                                                                                              color: Color(0xFF3B3B98),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Image.asset('assets/images/failed.png'),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        Text(
                                                                                          'Sorry'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.01,
                                                                                        ),
                                                                                        Text(
                                                                                          'Please pay the subscription fee of 300 R.S'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: widthApp * 0.33,
                                                                                          height: heightApp * 0.044,
                                                                                          child: ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Theme.of(context).primaryColor,
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                // print(GetStorage().read("activityID"));

                                                                                                controller.companyID = controller.CompanyList[index].companyID;

                                                                                                try {
                                                                                                  var items = await GetPayment(controller.CompanyList[index].companyID, controller.token);
                                                                                                  controller.url.value = items.data!;
                                                                                                  print("^^^^^^^6");
                                                                                                  print(controller.url.value.toString());
                                                                                                  controller.update();

                                                                                                  Get.back();

                                                                                                  Completer<WebViewController> _controller = Completer<WebViewController>();

                                                                                                  showDialog(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context) {
                                                                                                        controller.dialogContext = context;
                                                                                                        return AlertDialog(
                                                                                                          scrollable: true,
                                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                          content: Column(
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: Alignment.topRight,
                                                                                                                child: IconButton(
                                                                                                                  onPressed: () {
                                                                                                                    Navigator.of(context).pop();
                                                                                                                    print(controller.url.value);
                                                                                                                  },
                                                                                                                  icon: const Icon(
                                                                                                                    Icons.close,
                                                                                                                    size: 33,
                                                                                                                    color: Color(0xFF3B3B98),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Obx(() => Container(
                                                                                                                    height: 500,
                                                                                                                    width: 400,
                                                                                                                    child: WebView(
                                                                                                                      onWebViewCreated: (controller) {
                                                                                                                        _controller.complete(controller);
                                                                                                                      },
                                                                                                                      zoomEnabled: false,
                                                                                                                      debuggingEnabled: true,
                                                                                                                      initialUrl: controller.url.value.toString(),
                                                                                                                      javascriptMode: JavascriptMode.unrestricted,
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      });
                                                                                                } catch (e) {
                                                                                                  if (Get.isDialogOpen == true) Get.back();
                                                                                                }
                                                                                              },
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  "Pay".tr,
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w700,
                                                                                                    color: kwhite,
                                                                                                  ),
                                                                                                ),
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          },
                                                                    text:
                                                                        ' pay now'
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // TextSpan(text: ' world!'),
                                                              ],
                                                            ),
                                                          ),
                                                          isDismissible: true,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .bounceInOut,
                                                          barBlur: 50,
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        )
                                                      : await Get.offAllNamed(
                                                          Routes.ITEMS,
                                                          arguments: [
                                                              controller
                                                                  .CompanyList[
                                                                      index]
                                                                  .companyID
                                                            ]);
                                                },
                                                icon: Icon(
                                                  Icons.view_headline_rounded,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                                label: Center(
                                                  child: Text(
                                                    "Show".tr,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // !controller.categoriesLis[index]
                                            //             .isPaid ||
                                            //         !controller.categoriesLis[index]
                                            //             .isActive
                                            //     ?
                                            // Expanded(
                                            //   child: SizedBox(
                                            //       height: heightApp * 0.044,
                                            //       width: widthApp * 0.25,
                                            //       child: ElevatedButton.icon(
                                            //         style:
                                            //             ElevatedButton.styleFrom(
                                            //           primary: kblue,
                                            //           shape:
                                            //               RoundedRectangleBorder(
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .circular(
                                            //                               12)),
                                            //         ),
                                            //         onPressed: () {
                                            //           showDialog(
                                            //               context: context,
                                            //               builder: (BuildContext
                                            //                   context) {
                                            //                 return AlertDialog(
                                            //                   backgroundColor:
                                            //                       Colors.white,
                                            //                   scrollable: true,
                                            //                   shape: const RoundedRectangleBorder(
                                            //                       borderRadius: BorderRadius
                                            //                           .all(Radius
                                            //                               .circular(
                                            //                                   12.0))),
                                            //                   content: Column(
                                            //                     children: [
                                            //                       Align(
                                            //                         alignment:
                                            //                             Alignment
                                            //                                 .topRight,
                                            //                         child:
                                            //                             IconButton(
                                            //                           onPressed:
                                            //                               () {
                                            //                             Get.back();
                                            //                           },
                                            //                           icon:
                                            //                               const Icon(
                                            //                             Icons
                                            //                                 .close,
                                            //                             size: 33,
                                            //                             color: Color(
                                            //                                 0xFF3B3B98),
                                            //                           ),
                                            //                         ),
                                            //                       ),
                                            //                       Image.asset(
                                            //                           'assets/images/failed.png'),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             heightApp *
                                            //                                 0.03,
                                            //                       ),
                                            //                       Text(
                                            //                         'عفوا',
                                            //                         style: TextStyle(
                                            //                             color:
                                            //                                 kblue),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             heightApp *
                                            //                                 0.01,
                                            //                       ),
                                            //                       Text(
                                            //                         'الرجاء دفع رسوم الاشتراك ١ ريال',
                                            //                         style: TextStyle(
                                            //                             color:
                                            //                                 kblue),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             heightApp *
                                            //                                 0.03,
                                            //                       ),
                                            //                       SizedBox(
                                            //                         width:
                                            //                             widthApp *
                                            //                                 0.33,
                                            //                         height:
                                            //                             heightApp *
                                            //                                 0.044,
                                            //                         child: ElevatedButton(
                                            //                             style: ElevatedButton.styleFrom(
                                            //                               primary:
                                            //                                   kblue,
                                            //                               shape: RoundedRectangleBorder(
                                            //                                   borderRadius:
                                            //                                       BorderRadius.circular(12)),
                                            //                             ),
                                            //                             onPressed: () async {
                                            //                               controller.id = controller
                                            //                                   .categoriesLis[index]
                                            //                                   .activityID;
                                            //                               // print(
                                            //                               //     "^^^^^^^^^^^^");
                                            //                               // print(
                                            //                               //     id);
                                            //                               // Get.dialog(
                                            //                               //   AlertDialog(
                                            //                               //     scrollable:
                                            //                               //         true,
                                            //                               //     content:
                                            //                               //         Column(
                                            //                               //       children: [
                                            //                               //         Text(
                                            //                               //           'الرجاء الانتظار',
                                            //                               //         ),
                                            //                               //         20.0.sizedHeight,
                                            //                               //         Custom_ProgressIndicator()
                                            //                               //       ],
                                            //                               //     ),
                                            //                               //   ),
                                            //                               //   barrierDismissible:
                                            //                               //       false,
                                            //                               // );

                                            //                               try {
                                            //                                 var items = await GetPayment(
                                            //                                     controller.id,
                                            //                                     controller.token);
                                            //                                 controller
                                            //                                     .url
                                            //                                     .value = items.data!;
                                            //                                 print(
                                            //                                     "^^^^^^^6");
                                            //                                 print(controller
                                            //                                     .url
                                            //                                     .value
                                            //                                     .toString());
                                            //                                 controller
                                            //                                     .update();

                                            //                                 Get.back();

                                            //                                 Completer<WebViewController>
                                            //                                     _controller =
                                            //                                     Completer<WebViewController>();

                                            //                                 showDialog(
                                            //                                     context: context,
                                            //                                     builder: (BuildContext context) {
                                            //                                         controller.dialogContext = context;
                                            //                                       return AlertDialog(
                                            //                                         backgroundColor: Colors.white,
                                            //                                         scrollable: true,
                                            //                                         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                            //                                         content: Column(
                                            //                                           children: [
                                            //                                             Align(
                                            //                                               alignment: Alignment.topRight,
                                            //                                               child: IconButton(
                                            //                                                 onPressed: () {
                                            //                                                   Navigator.of(context).pop();
                                            //                                                   print(controller.url.value);
                                            //                                                 },
                                            //                                                 icon: const Icon(
                                            //                                                   Icons.close,
                                            //                                                   size: 33,
                                            //                                                   color: Color(0xFF3B3B98),
                                            //                                                 ),
                                            //                                               ),
                                            //                                             ),
                                            //                                             Obx(() => Container(
                                            //                                                   height: 500,
                                            //                                                   width: 400,
                                            //                                                   child: WebView(
                                            //                                                     onWebViewCreated: (controller) {
                                            //                                                       _controller.complete(controller);
                                            //                                                     },
                                            //                                                     zoomEnabled: false,
                                            //                                                     debuggingEnabled: true,
                                            //                                                     initialUrl: controller.url.value.toString(),
                                            //                                                     javascriptMode: JavascriptMode.unrestricted,
                                            //                                                   ),
                                            //                                                 )),
                                            //                                           ],
                                            //                                         ),
                                            //                                       );
                                            //                                     });
                                            //                               } catch (e) {
                                            //                                 if (Get.isDialogOpen ==
                                            //                                     true)
                                            //                                   Get.back();
                                            //                               }
                                            //                             },
                                            //                             child: Center(
                                            //                               child:
                                            //                                   Text(
                                            //                                 "الدفع",
                                            //                                 style:
                                            //                                     kWhite_text,
                                            //                               ),
                                            //                             )),
                                            //                       )
                                            //                     ],
                                            //                   ),
                                            //                 );
                                            //               });
                                            //         },
                                            //         icon: const Icon(
                                            //           Icons
                                            //               .local_printshop_outlined,
                                            //           color: Colors.white,
                                            //         ),
                                            //         label: Center(
                                            //           child: Text(
                                            //             "printing".tr,
                                            //             style: kWhite_text,
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ),
                                            // )
                                            // :

                                            //                                       Expanded(
                                            //                                         child: SizedBox(
                                            //                                           height: heightApp * 0.044,
                                            //                                           width: widthApp * 0.28,
                                            //                                           child: ElevatedButton.icon(
                                            //                                             style: ElevatedButton
                                            //                                                 .styleFrom(
                                            //                                               primary: Theme.of(context).primaryColorDark,
                                            //                                               shape: RoundedRectangleBorder(
                                            //                                                   borderRadius:
                                            //                                                       BorderRadius
                                            //                                                           .circular(
                                            //                                                               12)),
                                            //                                             ),
                                            //                                             onPressed: () {
                                            //                                               Get.offAndToNamed(
                                            //                                                   Routes.PRINT,
                                            //                                                   arguments: [
                                            //                                                     controller
                                            //                                                         .categoriesLis[
                                            //                                                             index]
                                            //                                                         .companyID
                                            //                                                         .toString(),
                                            //                                                     controller
                                            //                                                         .categoriesLis[
                                            //                                                             index]
                                            //                                                         .ishasTax

                                            //                                                   ]);
                                            //                                             },
                                            //                                             icon:  Icon(
                                            //                                               Icons
                                            //                                                   .local_printshop_outlined,
                                            //                                               color:  Theme.of(context).primaryColorLight,
                                            //                                             ),
                                            //                                             label: Center(
                                            //                                               child: Text(
                                            //                                                 "printing".tr,

                                            //                                                 style:  TextStyle(color: Theme.of(context).primaryColorLight,  fontSize: 14,
                                            // fontWeight: FontWeight.w700,),
                                            //                                               ),
                                            //                                             ),
                                            //                                           ),
                                            //                                         ),
                                            //                                       )
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("address".tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                      controller
                                                          .CompanyList[index]
                                                          .address
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text("phone number".tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                      controller
                                                          .CompanyList[index]
                                                          .phoneNo
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text("Country".tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                      lang.appLocale == 'en'
                                                          ? controller
                                                              .CompanyList[
                                                                  index]
                                                              .countryEName
                                                              .toString()
                                                          : controller
                                                              .CompanyList[
                                                                  index]
                                                              .countryAName
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3 /
                                                  2,
                                              width: 2,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              margin: const EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Tax Number".tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                      controller
                                                          .CompanyList[index]
                                                          .taxNumber
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                        "Commercial Register"
                                                            .tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                      controller
                                                          .CompanyList[index]
                                                          .commercialRecordNo
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text("Currency".tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Text(
                                                      lang.appLocale == 'en'
                                                          ? controller
                                                              .CompanyList[
                                                                  index]
                                                              .currencyEName
                                                              .toString()
                                                          : controller
                                                              .CompanyList[
                                                                  index]
                                                              .currencyAName
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                        : Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                ),
                                Text(
                                  "There is no registered activity".tr,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.ADD_ACTIVITY);
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
                    FloatingActionButtonLocation.startDocked);
          }),
    );
  }
}
