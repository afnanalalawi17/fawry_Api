import 'dart:async';
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dropdown.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/grey_Text_Field.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Services/get_payment.dart';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:fawry_app/app/document/PdfPurchase.dart';
import 'package:fawry_app/app/data/Services/RegisterSupplier.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/history2_controller.dart';

class History2View extends GetView<History2Controller> {
  List ListUser = [];
  // List ListProduct = [];
  bool shouldDisplay = false;

  String? text;
  int? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  num? total;
  num? totalWithTax;
  final lang = Get.put(AppLanguageController());
  num totalAmount = 0.0;
  num AllTotal = 0.0;
  num totalAmountwithtax = 0.0;
  num? discunt = 0.0;
  num? discountwittax = 00.0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Purchase invoices'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            leading: BackButton(
              color: Theme.of(context).primaryColorDark,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: GetBuilder<History2Controller>(
              init: History2Controller(),
              initState: (_) {},
              builder: (_) {
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      // give the tab bar a height [can change hheight to preferred height]
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kblack, width: 1)),
                        child: TabBar(
                          // controller: _tabController,
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Theme.of(context).primaryColor,
                          tabs: [
                            Tab(
                              child: Text(
                                'Purchase invoices'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Show'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // tab bar view here
                      Expanded(
                        child: TabBarView(children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: heightApp * 0.012,
                                  ),
                                  Column(
                                    children: [
                                      ListView(
                                        physics: const ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        children: ListUser.map((document) {
                                          return Container(
                                            // margin: const EdgeInsets.only(
                                            //     bottom: 20),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                                              closeOnScroll: false,
                                              // create a key
                                              key: const ValueKey('key'),

                                              startActionPane: ActionPane(
                                                motion: const ScrollMotion(),
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              scrollable: true,
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              12.0))),
                                                              content: Text(
                                                                  "Are you sure to delete this service?"
                                                                      .tr),
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
                                                                  onPressed:
                                                                      () {
                                                                    ListUser.remove(
                                                                        document);
                                                                    controller
                                                                        .update();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    controller
                                                                        .nameController
                                                                        .text = '';
                                                                    controller
                                                                        .addressController
                                                                        .text = '';
                                                                    controller
                                                                        .phoneController
                                                                        .text = '';
                                                                    controller
                                                                        .numberController
                                                                        .text = '';
                                                                    controller
                                                                        .update();
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child: Text(
                                                                      "cancel"
                                                                          .tr),
                                                                  onPressed:
                                                                      () {
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
                                                      height: 120,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      width: 85,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius: lang
                                                                    .appLocale ==
                                                                'en'
                                                            ? BorderRadius
                                                                .horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            12))
                                                            : BorderRadius
                                                                .horizontal(
                                                                right: Radius
                                                                    .circular(
                                                                        12),
                                                              ),
                                                      ),
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
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "SupplierName"
                                                                      .tr +
                                                                  ": ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  heightApp *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              document[
                                                                  'SupplierName'],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Address".tr +
                                                                  ": ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  heightApp *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              document[
                                                                  'Address'],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Phone".tr + ": ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  heightApp *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              document['Phone'],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "VAT registration number"
                                                                      .tr +
                                                                  ": ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  heightApp *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              document[
                                                                  'VAT number'],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                  Form(
                                    key: controller.ADDitemFormKey2,
                                    child: Column(
                                      children: [
                                        Dropdown(
                                          onChanged: (p0) {
                                            controller.key.currentState!
                                                .reset();
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select a Company'
                                                  .tr;
                                            }

                                            return null;
                                          },
                                          items: lang.appLocale == 'en'
                                              ? controller.ActivityList.map(
                                                  (value) {
                                                  return DropdownMenuItem<int>(
                                                    value: value.companyID,
                                                    child: Text(
                                                        value.companyEName!),
                                                    onTap: () {
                                                      controller.isActive =
                                                          value.subscription![0]
                                                              .isActive!;
                                                      controller.isActive ==
                                                              false
                                                          ? Get.rawSnackbar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                              snackStyle:
                                                                  SnackStyle
                                                                      .FLOATING,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              borderRadius: 15,
                                                              messageText:
                                                                  RichText(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                text: TextSpan(
                                                                  text:
                                                                      "Subscription expired please"
                                                                          .tr,
                                                                  // .

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

                                                                                                    // controller.companyID = controller.CompanyList[index].companyID;

                                                                                                    try {
                                                                                                      var items = await GetPayment(controller.companyID, controller.token);
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
                                                                        text: ' pay now'
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    // TextSpan(text: ' world!'),
                                                                  ],
                                                                ),
                                                              ),
                                                              isDismissible:
                                                                  true,
                                                              forwardAnimationCurve:
                                                                  Curves
                                                                      .bounceInOut,
                                                              barBlur: 50,
                                                              snackPosition:
                                                                  SnackPosition
                                                                      .TOP,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                            )
                                                          : print('fgfg');
                                                      controller.ishasTax =
                                                          value.ishasTax;
                                                      controller.tax =
                                                          int.parse(value
                                                                  .taxValue
                                                                  .toString()) /
                                                              100;
                                                      print(controller.tax);
                                                      controller.companyID =
                                                          value.companyID;
                                                      controller.companyEName =
                                                          value.companyEName;
                                                      print(
                                                          controller.companyID);

                                                      controller
                                                          .fetchMYSupplier(
                                                              controller
                                                                  .companyID);
                                                      controller.fetchMYItems();
                                                      controller.update();
                                                    },
                                                  );
                                                }).toList()
                                              : controller.ActivityList.map(
                                                  (value) {
                                                  return DropdownMenuItem<int>(
                                                    value: value.companyID,
                                                    child: Text(
                                                        value.companyAName!),
                                                    onTap: () {
                                                      controller.isActive =
                                                          value.subscription![0]
                                                              .isActive!;
                                                      controller.isActive ==
                                                              false
                                                          ? Get.rawSnackbar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                              snackStyle:
                                                                  SnackStyle
                                                                      .FLOATING,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              borderRadius: 15,
                                                              messageText:
                                                                  RichText(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                text: TextSpan(
                                                                  text:
                                                                      "Subscription expired please"
                                                                          .tr,
                                                                  // .

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

                                                                                                    // controller.companyID = controller.CompanyList[index].companyID;

                                                                                                    try {
                                                                                                      var items = await GetPayment(controller.companyID, controller.token);
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
                                                                        text: ' pay now'
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    // TextSpan(text: ' world!'),
                                                                  ],
                                                                ),
                                                              ),
                                                              isDismissible:
                                                                  true,
                                                              forwardAnimationCurve:
                                                                  Curves
                                                                      .bounceInOut,
                                                              barBlur: 50,
                                                              snackPosition:
                                                                  SnackPosition
                                                                      .TOP,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                            )
                                                          : print('fgfg');
                                                      controller.ishasTax =
                                                          value.ishasTax;
                                                      controller.tax =
                                                          int.parse(value
                                                                  .taxValue
                                                                  .toString()) /
                                                              100;
                                                      controller.companyID =
                                                          value.companyID;
                                                      controller
                                                          .fetchMYSupplier(
                                                              controller
                                                                  .companyID);

                                                      controller.fetchMYItems();
                                                      controller.companyAName =
                                                          value.companyAName;
                                                      controller.update();
                                                      controller.update();
                                                    },
                                                  );
                                                }).toList(),
                                          hintText: 'Company selection'.tr,
                                        ),

                                        // SizedBox(
                                        //   height: heightApp * 0.01,
                                        // ),
                                        controller.isActive == true
                                            ? Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Form(
                                                          key: controller.key,
                                                          child:
                                                              DropdownButtonFormField(
                                                            iconEnabledColor:
                                                                Theme.of(
                                                                        context)
                                                                    .primaryColor,

                                                            style: TextStyle(
                                                                color: kblack),
                                                            dropdownColor:
                                                                kwhite,

                                                            //  key: controller.ADDdropFormKey,
                                                            validator: (value) {
                                                            
                                                              if (value ==
                                                                  null) {
                                                                return 'Please select a Supplier'
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
                                                              fillColor: kwhite,
                                                              filled: true,
                                                              hintText:
                                                                  'Supplier selection'
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
                                                                        .circular(
                                                                            12),
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
                                                                        .circular(
                                                                            12),
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
                                                                        .circular(
                                                                            12),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ),
                                                            items: lang.appLocale ==
                                                                    'en'
                                                                ? controller
                                                                        .SupplierList
                                                                    .map(
                                                                        (value) {
                                                                    return DropdownMenuItem<
                                                                        int>(
                                                                      value: value
                                                                          .supplierID,
                                                                      child: Text(
                                                                          value
                                                                              .supplierEName!),
                                                                      onTap:
                                                                          () {
                                                                        controller.supplierID =
                                                                            value.supplierID;
                                                                        controller.supplierEName =
                                                                            value.supplierEName;
                                                                      },
                                                                    );
                                                                  }).toList()
                                                                : controller
                                                                        .SupplierList
                                                                    .map(
                                                                        (value) {
                                                                    return DropdownMenuItem<
                                                                        int>(
                                                                      value: value
                                                                          .supplierID,
                                                                      child: Text(
                                                                          value
                                                                              .supplierAName!),
                                                                      onTap:
                                                                          () {
                                                                        controller.supplierID =
                                                                            value.supplierID;
                                                                        controller.supplierAName =
                                                                            value.supplierAName;
                                                                      },
                                                                    );
                                                                  }).toList(),
                                                            onChanged:
                                                                (newValue) {},

                                                            isExpanded: true,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: widthApp * 0.03,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // shouldDisplay = true;
                                                          // controller.update();
                                                          // print(shouldDisplay);

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                // on(int index) {
                                                                //   controller.selectedIndex = index;
                                                                //   controller.update();
                                                                // }

                                                                return GetBuilder<
                                                                        History2Controller>(
                                                                    init:
                                                                        History2Controller(),
                                                                    initState:
                                                                        (_) {},
                                                                    builder:
                                                                        (_) {
                                                                      return AlertDialog(
                                                                          shape:
                                                                              const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                          actionsPadding: EdgeInsets.all(12),
                                                                          actions: [
                                                                            Column(children: [
                                                                              Form(
                                                                                key: controller.ADDitemFormKey,
                                                                                child: Column(
                                                                                  children: [
                                                                                    Container(
                                                                                      // height: 60.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                        color: kwhite,
                                                                                        //border: Border.all(color: kblue, width: 2)
                                                                                      ),
                                                                                      child: DropdownButtonFormField(
                                                                                        //  value: controller.ActivityList[0],
                                                                                        iconEnabledColor: Theme.of(context).primaryColor,
                                                                                        iconDisabledColor: Theme.of(context).primaryColor,
                                                                                        style: TextStyle(color: kblack),
                                                                                        dropdownColor: kwhite,

                                                                                        //  key: controller.ADDdropFormKey,
                                                                                        validator: (value) {
                                                                                          print(value.runtimeType);
                                                                                          if (value == null) {
                                                                                            return 'Please select a Company'.tr;
                                                                                          }

                                                                                          return null;
                                                                                        },
                                                                                        isDense: true,
                                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,

                                                                                        decoration: InputDecoration(
                                                                                          hintText: 'Company selection'.tr,
                                                                                          hintStyle: TextStyle(color: kblack, fontSize: 13, fontWeight: FontWeight.w300),
                                                                                          border: const OutlineInputBorder(),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            borderSide: BorderSide(
                                                                                              color: Theme.of(context).primaryColor,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            borderSide: BorderSide(
                                                                                              color: Theme.of(context).primaryColor,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.red,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.red,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        items: lang.appLocale == 'en'
                                                                                            ? controller.ActivityList.map((value) {
                                                                                                return DropdownMenuItem<int>(
                                                                                                  value: value.companyID,
                                                                                                  child: Text(value.companyEName!),
                                                                                                  onTap: () {
                                                                                                    controller.companyID = value.companyID;
                                                                                                    print(value.companyEName.toString());
                                                                                                    controller.update();
                                                                                                  },
                                                                                                );
                                                                                              }).toList()
                                                                                            : controller.ActivityList.map((value) {
                                                                                                return DropdownMenuItem<int>(
                                                                                                  value: value.companyID,
                                                                                                  child: Text(value.companyAName!),
                                                                                                  onTap: () {
                                                                                                    controller.companyID = value.companyID;
                                                                                                    controller.update();
                                                                                                  },
                                                                                                );
                                                                                              }).toList(),
                                                                                        onChanged: (newValue) {},

                                                                                        isExpanded: true,
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
                                                                                      label: 'Supplier name'.tr,
                                                                                    ),
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
                                                                                        return controller.validate(value!);
                                                                                      },
                                                                                      label: 'address'.tr,
                                                                                    ),
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
                                                                                        return controller.validateMobile(value!);
                                                                                      },
                                                                                      label: 'phone number'.tr,
                                                                                    ),
                                                                                    BoxTextField(
                                                                                      controller: controller.numberController,
                                                                                      keyboardType: TextInputType.number,
                                                                                      onSaved: (value) {
                                                                                        controller.number = value;
                                                                                      },
                                                                                      onChanged: (value) {
                                                                                        controller.number = value;
                                                                                      },
                                                                                      validator: (value) {
                                                                                        return controller.validateNumber(value!);
                                                                                      },
                                                                                      label: 'VAT registration number'.tr,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: heightApp * 0.066,
                                                                                child: ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      primary: Theme.of(context).primaryColor,
                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                    ),
                                                                                    child: Center(
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(Icons.add),
                                                                                          SizedBox(
                                                                                            width: widthApp * 0.01,
                                                                                          ),
                                                                                          Text(
                                                                                            "Add Supplier".tr,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      // controller.key.currentState!.reset();
                                                                                      // controller.key1.currentState!.reset();
                                                                                      // controller.key2.currentState!.reset();
                                                                                      if (controller.ADDitemFormKey.currentState!.validate()) {
                                                                                        ListUser.add({
                                                                                          'SupplierName': controller.nameController.text,
                                                                                          'Address': controller.addressController.text,
                                                                                          'Phone': controller.phoneController.text,
                                                                                          'VAT number': controller.numberController.text
                                                                                        });
                                                                                        controller.update();

                                                                                        print('*********************');
                                                                                      }

                                                                                      try {
                                                                                        final _res = await RegisterSupplier(controller.companyID, controller.email.toString(), controller.nameController.text, controller.nameController.text, controller.phoneController.text, controller.addressController.text, controller.numberController.text, controller.token);
                                                                                        if (Get.isDialogOpen == true) Get.back();
                                                                                        controller.fetchMYSupplier(controller.companyID.toString());

                                                                                        controller.update();
                                                                                        print("*******************");

                                                                                        controller.nameController.text = '';
                                                                                        controller.addressController.text = '';
                                                                                        controller.phoneController.text = '';
                                                                                        controller.numberController.text = '';
                                                                                        controller.ADDitemFormKey.currentState!.reset();
                                                                                        showSuccessSnackBar('Added successfully'.tr);
                                                                                        print("*******************");
                                                                                        Navigator.pop(context);
                                                                                      } catch (e) {
                                                                                        if (Get.isDialogOpen == true) Get.back();

                                                                                        // Navigator.pop(context);
                                                                                        showErrorSnackBar('There is an error, please try again'.tr);
                                                                                      }
// Navigator.pop(context);

                                                                                      controller.update();
                                                                                    }),
                                                                              ),
                                                                            ])
                                                                          ]);
                                                                    });
                                                              });
                                                        },
                                                        child: Container(
                                                          width: 50,
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                              color: kwhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border: Border.all(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 2)),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: heightApp * 0.01,
                                                  ),
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
                                                          onTap: () {
                                                            
                                                  
                                                          },
                                                      // key: controller.key2,
                                                      iconEnabledColor:
                                                          Theme.of(context)
                                                              .primaryColor,

                                                      style: TextStyle(
                                                          color: kblack),
                                                      dropdownColor: kwhite,

                                                      //  key: controller.ADDdropFormKey,
                                                      validator: (value) {
                                                       
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
                                                      items: lang.appLocale ==
                                                              'en'
                                                          ? controller.ItemsList
                                                              .map((value) {
                                                              return DropdownMenuItem<
                                                                  int>(
                                                                value: value
                                                                    .itemTypeID,
                                                                child: Text(value
                                                                    .itemTypeEName!),
                                                                onTap: () {
                                                                  controller
                                                                          .itemTypeID =
                                                                      value
                                                                          .itemTypeID;
                                                                  controller
                                                                          .itemTypeName =
                                                                      value
                                                                          .itemTypeEName;

                                                                  controller
                                                                          .itemTypeEName =
                                                                      value
                                                                          .itemTypeEName;
                                                                  controller
                                                                      .fetchMYServices();
                                                                },
                                                              );
                                                            }).toList()
                                                          : controller.ItemsList
                                                              .map((value) {
                                                              return DropdownMenuItem<
                                                                  int>(
                                                                value: value
                                                                    .itemTypeID,
                                                                child: Text(value
                                                                    .itemTypeAName!),
                                                                onTap: () {
                                                                  controller
                                                                          .itemTypeID =
                                                                      value
                                                                          .itemTypeID;
                                                                  controller
                                                                          .itemTypeName =
                                                                      value
                                                                          .itemTypeAName;
                                                                  controller
                                                                          .itemTypeAName =
                                                                      value
                                                                          .itemTypeAName;
                                                                  controller
                                                                      .fetchMYServices();
                                                                  controller
                                                                      .update();
                                                                },
                                                              );
                                                            }).toList(),
                                                      onChanged: (newValue) {},

                                                      isExpanded: true,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: heightApp * 0.01,
                                                  ),
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
                                                          return 'Please select a product'
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
                                                            'product selection'
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
                                                      items: lang.appLocale ==
                                                              'en'
                                                          ? controller
                                                                  .ServicesList
                                                              .map((value) {
                                                              return DropdownMenuItem<
                                                                  int>(
                                                                value: value
                                                                    .itemID,
                                                                child: Text(value
                                                                    .itemEName!),
                                                                onTap: () {
                                                                  controller
                                                                          .itemishastax =
                                                                      value
                                                                          .itemishasTax;
                                                                  controller
                                                                          .itemID =
                                                                      value
                                                                          .itemID;
                                                                  controller
                                                                          .itemName =
                                                                      value
                                                                          .itemEName;

                                                                  controller
                                                                          .itemEName =
                                                                      value
                                                                          .itemEName;
                                                                },
                                                              );
                                                            }).toList()
                                                          : controller
                                                                  .ServicesList
                                                              .map((value) {
                                                              return DropdownMenuItem<
                                                                  int>(
                                                                value: value
                                                                    .itemID,
                                                                child: Text(value
                                                                    .itemAName!),
                                                                onTap: () {
                                                                  controller
                                                                          .itemishastax =
                                                                      value
                                                                          .itemishasTax;
                                                                  controller
                                                                          .itemID =
                                                                      value
                                                                          .itemID;
                                                                  controller
                                                                          .itemName =
                                                                      value
                                                                          .itemAName;
                                                                  controller
                                                                          .itemAName =
                                                                      value
                                                                          .itemAName;

                                                                  controller
                                                                      .update();
                                                                },
                                                              );
                                                            }).toList(),
                                                      onChanged: (newValue) {},

                                                      isExpanded: true,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: heightApp * 0.01,
                                                  ),
                                                  BoxTextField(
                                                      controller: controller
                                                          .countController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onChanged: (value) {
                                                        if (controller
                                                            .countController
                                                            .text
                                                            .isNotEmpty) {
                                                          print(controller
                                                              .ishasTax);
                                                          print(controller
                                                              .itemishastax);
                                                          total = double.parse(
                                                                  controller
                                                                      .unitController
                                                                      .text) *
                                                              int.parse(controller
                                                                  .countController
                                                                  .text);
                                                          controller
                                                              .totalController
                                                              .text = (double.parse(
                                                                      controller
                                                                          .unitController
                                                                          .text) *
                                                                  int.parse(
                                                                      controller
                                                                          .countController
                                                                          .text))
                                                              .toString();

                                                          if (controller
                                                                      .ishasTax ==
                                                                  true ||
                                                              controller
                                                                      .itemishastax ==
                                                                  true) {
                                                            totalWithTax = (total! +
                                                                (total! *
                                                                    controller
                                                                        .tax));
                                                            controller
                                                                .totalWithTaxController
                                                                .text = (total! +
                                                                    (total! *
                                                                        controller
                                                                            .tax))
                                                                .toString();
                                                          } else if (controller
                                                                      .ishasTax ==
                                                                  true ||
                                                              controller
                                                                      .itemishastax ==
                                                                  false) {
                                                            total = double.parse(
                                                                    controller
                                                                        .unitController
                                                                        .text) *
                                                                int.parse(controller
                                                                    .countController
                                                                    .text);
                                                            controller
                                                                .totalController
                                                                .text = (double.parse(controller
                                                                        .unitController
                                                                        .text) *
                                                                    int.parse(controller
                                                                        .countController
                                                                        .text))
                                                                .toString();
                                                          } else if (controller
                                                                      .ishasTax ==
                                                                  false ||
                                                              controller
                                                                      .itemishastax ==
                                                                  false)
                                                            controller
                                                                .totalWithTaxController
                                                                .text = '00.0';
                                                        } else {
                                                          controller
                                                              .totalController
                                                              .clear();
                                                          controller
                                                              .totalWithTaxController
                                                              .clear();
                                                        }
                                                        controller.update();
                                                      },
                                                      validator: (value) {
                                                        return controller
                                                            .validate(value!);
                                                      },
                                                      label: "Count".tr),
                                                  BoxTextField(
                                                      controller: controller
                                                          .unitController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onSaved: (value) {
                                                        controller.unit = value;
                                                      },
                                                      onChanged: (value) {
                                                        if (controller
                                                            .unitController
                                                            .text
                                                            .isNotEmpty) {
                                                          total = double.parse(
                                                                  controller
                                                                      .unitController
                                                                      .text) *
                                                              int.parse(controller
                                                                  .countController
                                                                  .text);
                                                          controller
                                                              .totalController
                                                              .text = (double.parse(
                                                                      controller
                                                                          .unitController
                                                                          .text) *
                                                                  int.parse(
                                                                      controller
                                                                          .countController
                                                                          .text))
                                                              .toString();

                                                          if (controller
                                                                      .ishasTax ==
                                                                  true ||
                                                              controller
                                                                      .itemishastax ==
                                                                  true) {
                                                            totalWithTax = (total! +
                                                                (total! *
                                                                    controller
                                                                        .tax));
                                                            controller
                                                                .totalWithTaxController
                                                                .text = (total! +
                                                                    (total! *
                                                                        controller
                                                                            .tax))
                                                                .toString();
                                                          } else if (controller
                                                                      .ishasTax ==
                                                                  true ||
                                                              controller
                                                                      .itemishastax ==
                                                                  false) {
                                                            total = double.parse(
                                                                    controller
                                                                        .unitController
                                                                        .text) *
                                                                int.parse(controller
                                                                    .countController
                                                                    .text);
                                                            controller
                                                                .totalController
                                                                .text = (double.parse(controller
                                                                        .unitController
                                                                        .text) *
                                                                    int.parse(controller
                                                                        .countController
                                                                        .text))
                                                                .toString();
                                                            controller
                                                                .totalWithTaxController
                                                                .text = '00.0';
                                                          } else if (controller
                                                                      .ishasTax ==
                                                                  false ||
                                                              controller
                                                                      .itemishastax ==
                                                                  false)

                                                            // ignore: curly_braces_in_flow_control_structures
                                                            controller
                                                                .totalWithTaxController
                                                                .text = '00.0';
                                                        } else {
                                                          controller
                                                              .totalController
                                                              .clear();
                                                          controller
                                                              .totalWithTaxController
                                                              .clear();
                                                        }
                                                        controller.update();
                                                      },
                                                      validator: (value) {
                                                        return controller
                                                            .validate(value!);
                                                      },
                                                      label: "unit price".tr),
                                                  BoxTextField(
                                                      controller: controller
                                                          .sellingController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onSaved: (value) {
                                                        controller.selling =
                                                            value;
                                                      },
                                                      onChanged: (value) {
                                                        controller.selling =
                                                            value;
                                                      },
                                                      validator: (value) {
                                                        return controller
                                                            .validate(value!);
                                                      },
                                                      label:
                                                          "selling price".tr),
                                                  BoxTextField(
                                                      controller: controller
                                                          .discountController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onSaved: (value) {
                                                        controller.discount =
                                                            value;
                                                      },
                                                      onChanged: (value) {
                                                        if (controller
                                                            .discountController
                                                            .text
                                                            .isNotEmpty) {
                                                          if (int.parse(controller
                                                                  .discountController
                                                                  .text) >=
                                                              total!) {
                                                            print(int.parse(
                                                                controller
                                                                    .discountController
                                                                    .text));
                                                            print(total);
                                                            controller
                                                                    .totalController
                                                                    .text =
                                                                total!
                                                                    .toString();
                                                            controller
                                                                    .totalWithTaxController
                                                                    .text =
                                                                totalWithTax
                                                                    .toString();
                                                            showErrorSnackBar(
                                                                "Please enter a discount value less than the amount to accept the discount"
                                                                    .tr);
                                                          } else {
                                                            print("object");

                                                            controller
                                                                    .totalController
                                                                    .text =
                                                                total!
                                                                    .toString();
                                                            controller
                                                                    .totalWithTaxController
                                                                    .text =
                                                                totalWithTax
                                                                    .toString();

                                                            discunt = (double.parse(
                                                                    controller
                                                                        .discountController
                                                                        .text)) -
                                                                total!;

                                                            controller
                                                                    .totalController
                                                                    .text =
                                                                discunt!
                                                                    .toString()
                                                                    .replaceAll(
                                                                        "-",
                                                                        "");
                                                            controller
                                                                    .totaldiscountController
                                                                    .text =
                                                                total!
                                                                    .toString();
                                                            if (controller
                                                                        .ishasTax ==
                                                                    true ||
                                                                controller
                                                                        .itemishastax ==
                                                                    true) {
                                                              // totalWithTax = (total! +
                                                              //     (total! *
                                                              //         controller.tax));
                                                              discountwittax =
                                                                  (discunt! +
                                                                      (discunt! *
                                                                          controller
                                                                              .tax));

                                                              controller
                                                                      .totalWithTaxController
                                                                      .text =
                                                                  discountwittax
                                                                      .toString()
                                                                      .replaceAll(
                                                                          "-",
                                                                          "");
                                                              print(
                                                                  "&&&&&&&&&&&&&&");
                                                              print(controller
                                                                  .totalWithTaxController
                                                                  .text
                                                                  .toString());
                                                              controller
                                                                      .totaldiscountController
                                                                      .text =
                                                                  total!
                                                                      .toString();
                                                            } else if (controller
                                                                        .ishasTax ==
                                                                    true ||
                                                                controller
                                                                        .itemishastax ==
                                                                    false) {
                                                              // total = double.parse(
                                                              //         controller
                                                              //             .unitController
                                                              //             .text) *
                                                              //     int.parse(controller
                                                              //         .countController
                                                              //         .text);
                                                              // controller.totalController
                                                              //     .text = (double.parse(
                                                              //             controller
                                                              //                 .unitController
                                                              //                 .text) *
                                                              //         int.parse(controller
                                                              //             .countController
                                                              //             .text))
                                                              //     .toString();
                                                              totalWithTax =
                                                                  00.0;
                                                              controller
                                                                  .totalWithTaxController
                                                                  .text = '00.0';
                                                              controller
                                                                      .totaldiscountController
                                                                      .text =
                                                                  total!
                                                                      .toString();
                                                            } else if (controller
                                                                        .ishasTax ==
                                                                    false ||
                                                                controller
                                                                        .itemishastax ==
                                                                    false) {
                                                              totalWithTax =
                                                                  00.0;
                                                              controller
                                                                  .totalWithTaxController
                                                                  .text = '00.0';

                                                              print(discunt);
                                                              print(
                                                                  discountwittax);
                                                              controller
                                                                      .totaldiscountController
                                                                      .text =
                                                                  total!
                                                                      .toString();
                                                              controller
                                                                  .update();
                                                            }
                                                          }
                                                        } else {
                                                          controller
                                                                  .totalController
                                                                  .text =
                                                              total!.toString();
                                                          controller
                                                              .totalWithTaxController
                                                              .text = double.parse(
                                                                  totalWithTax
                                                                      .toString())
                                                              .toString();
                                                        }
                                                        controller.update();
                                                      },
                                                      label: "Discount".tr),
                                                  if (controller
                                                          .discountController
                                                          .text
                                                          .isNotEmpty &&
                                                      int.parse(controller
                                                              .discountController
                                                              .text) <=
                                                          total! &&
                                                      discunt != 00.0)
                                                    //  if (int.parse(controller
                                                    //             .discountController
                                                    //             .text) <=
                                                    //         total!)
                                                    GreyTextField(
                                                      readOnly: true,
                                                      textAlign:
                                                          lang.appLocale == 'en'
                                                              ? TextAlign.left
                                                              : TextAlign.right,
                                                      controller: controller
                                                          .totaldiscountController,
                                                      label:
                                                          "total before discount"
                                                              .tr,
                                                    )
                                                  // : SizedBox(
                                                  //     height: heightApp * 0.01,
                                                  //   )
                                                  else
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                  if (controller
                                                          .discountController
                                                          .text
                                                          .isNotEmpty &&
                                                      int.parse(controller
                                                              .discountController
                                                              .text) <=
                                                          total! &&
                                                      discunt != 00.0)
                                                    GreyTextField(
                                                        readOnly: true,
                                                        textAlign:
                                                            lang.appLocale ==
                                                                    'en'
                                                                ? TextAlign.left
                                                                : TextAlign
                                                                    .right,
                                                        controller: controller
                                                            .totalController,
                                                        label:
                                                            //  "Total".tr
                                                            'total after discount'
                                                                .tr)
                                                  else
                                                    GreyTextField(
                                                        readOnly: true,
                                                        textAlign:
                                                            lang.appLocale ==
                                                                    'en'
                                                                ? TextAlign.left
                                                                : TextAlign
                                                                    .right,
                                                        controller: controller
                                                            .totalController,
                                                        label: "Total".tr
                                                        // 'total after discount'.tr
                                                        ),

                                                  //       GreyTextField(
                                                  // readOnly: true,
                                                  // textAlign: lang.appLocale == 'en'
                                                  //     ? TextAlign.left
                                                  //     : TextAlign.right,
                                                  // controller:

                                                  //     controller.totalController,
                                                  // label:
                                                  //     //  "Total".tr
                                                  //     'total after discount'.tr
                                                  //      ),
                                                  GreyTextField(
                                                      readOnly: true,
                                                      textAlign:
                                                          lang.appLocale == 'en'
                                                              ? TextAlign.left
                                                              : TextAlign.right,
                                                      controller: controller
                                                          .totalWithTaxController,
                                                      label:
                                                          "Total including tax"
                                                              .tr),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Enable product inventory"
                                                            .tr,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorDark),
                                                      ),
                                                      Transform.scale(
                                                          scale: 0.8,
                                                          child: Obx(
                                                            () => Switch(
                                                              activeColor: Theme
                                                                      .of(context)
                                                                  .primaryColorDark,
                                                              onChanged: (val) =>
                                                                  controller
                                                                      .toggle(),
                                                              value: controller
                                                                  .on.value,
                                                            ),
                                                          ))
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: heightApp * 0.066,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(Icons.add),
                                                              SizedBox(
                                                                width:
                                                                    widthApp *
                                                                        0.01,
                                                              ),
                                                              Text(
                                                                "Add product"
                                                                    .tr,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          if (controller
                                                              .ADDitemFormKey2
                                                              .currentState!
                                                              .validate()) {
                                                            controller
                                                                    .totalproduct +=
                                                                double.parse(
                                                                    controller
                                                                        .totalController
                                                                        .text);
                                                            controller.totalWithTaxController
                                                                        .text
                                                                        .toString() ==
                                                                    '00.0'
                                                                ? controller
                                                                        .totalwithtaxproductPdf =
                                                                    double.parse(
                                                                        '00.0')
                                                                : controller
                                                                    .totalwithtaxproductPdf += (double.parse(controller
                                                                        .totalController
                                                                        .text) -
                                                                    double.parse(controller
                                                                        .totalWithTaxController
                                                                        .text));
                                                            controller.totalWithTaxController
                                                                        .text
                                                                        .toString() ==
                                                                    '00.0'
                                                                ? controller
                                                                        .totalwithtaxproduct =
                                                                    double.parse(controller
                                                                        .totalproduct
                                                                        .toString())
                                                                : controller
                                                                        .totalwithtaxproduct +=
                                                                    double.parse(
                                                                        controller
                                                                            .totalWithTaxController
                                                                            .text);
//  controller.discountController.text.toString() == ''
// ? controller.totaldicount = double.parse('0'.toString())
// :
                                                            controller.discountController
                                                                        .text
                                                                        .toString() ==
                                                                    ''
                                                                ? controller
                                                                    .discountController
                                                                    .text = '0'
                                                                : controller
                                                                    .discountController
                                                                    .text;
                                                            controller
                                                                    .totaldicount +=
                                                                double.parse(
                                                                    controller
                                                                        .discountController
                                                                        .text);

                                                            print(
                                                                '_______________Total____________');
                                                            print(totalAmount);
                                                            print(controller
                                                                .totalproduct);
                                                            print(controller
                                                                .totalWithTaxController);
                                                            print(controller
                                                                .totaldicount);
                                                            if (controller
                                                                        .ishasTax ==
                                                                    true ||
                                                                controller
                                                                        .itemishastax ==
                                                                    true) {
                                                              totalAmountwithtax += (int.parse(controller
                                                                          .countController
                                                                          .text) *
                                                                      double.parse(controller
                                                                          .unitController
                                                                          .text) +
                                                                  (int.parse(controller
                                                                              .countController
                                                                              .text) *
                                                                          double.parse(controller
                                                                              .unitController
                                                                              .text)) *
                                                                      controller
                                                                          .tax);
                                                              print(
                                                                  totalAmountwithtax);
                                                              AllTotal =
                                                                  totalAmountwithtax -
                                                                      totalAmount;
                                                              print(AllTotal);
                                                            } else if (controller
                                                                        .ishasTax ==
                                                                    true ||
                                                                controller
                                                                        .itemishastax ==
                                                                    false) {
                                                              totalAmountwithtax += (int.parse(
                                                                      controller
                                                                          .countController
                                                                          .text) *
                                                                  double.parse(
                                                                      controller
                                                                          .unitController
                                                                          .text));

                                                              print(
                                                                  totalAmountwithtax);
                                                              AllTotal = 0.0;
                                                              print(AllTotal);
                                                            } else if (controller
                                                                        .ishasTax ==
                                                                    false ||
                                                                controller
                                                                        .itemishastax ==
                                                                    false) {
                                                              AllTotal = 0.0;
                                                              print(AllTotal);
                                                              totalAmountwithtax += (int.parse(
                                                                      controller
                                                                          .countController
                                                                          .text) *
                                                                  double.parse(
                                                                      controller
                                                                          .unitController
                                                                          .text));

                                                              print(
                                                                  totalAmountwithtax);
                                                            }
                                                            print(
                                                                "_______________invoice_____________");
                                                            print(
                                                                totalAmountwithtax);
                                                            print(AllTotal);
                                                            controller
                                                                    .ListProduct
                                                                .add({
                                                              'ItemID':
                                                                  controller
                                                                      .itemID,
                                                              'product name':
                                                                  controller
                                                                      .itemName
                                                                      .toString(),
                                                              'ItemCount':
                                                                  controller
                                                                      .countController
                                                                      .text,
                                                              'PurchasePrice':
                                                                  controller
                                                                      .unitController
                                                                      .text,
                                                              'ItemPrice':
                                                                  controller
                                                                      .sellingController
                                                                      .text,
                                                              'Discount': controller
                                                                  .discountController
                                                                  .text,
                                                              'TotalAmount':
                                                                  controller
                                                                      .totalController
                                                                      .text,
                                                              'TotalIncludingTax':
                                                                  controller
                                                                      .totalWithTaxController
                                                                      .text
                                                            });
                                                            controller.ListFinal
                                                                .add({
                                                              'ItemID':
                                                                  controller
                                                                      .itemID,
                                                              'ItemCount':
                                                                  controller
                                                                      .countController
                                                                      .text,
                                                              'PurchasePrice':
                                                                  controller
                                                                      .unitController
                                                                      .text,
                                                              'ItemPrice':
                                                                  controller
                                                                      .sellingController
                                                                      .text,
                                                              'TotalAmount':
                                                                  controller
                                                                      .totalController
                                                                      .text,
                                                              'TotalIncludingTax':
                                                                  controller
                                                                      .totalWithTaxController
                                                                      .text
                                                            });
                                                            showSuccessSnackBar(
                                                                "Added successfully"
                                                                    .tr);

                                                            controller.selling =
                                                                controller
                                                                    .sellingController
                                                                    .text;
                                                            ;
                                                            controller
                                                                .countController
                                                                .text = '';
                                                            controller
                                                                .unitController
                                                                .text = '';
                                                            controller
                                                                .totalController
                                                                .text = '';
                                                            controller
                                                                .sellingController
                                                                .text = '';
                                                            controller
                                                                .unitController
                                                                .text = '';
                                                            controller
                                                                .totalWithTaxController
                                                                .text = '';
                                                            controller
                                                                .discountController
                                                                .text = '';
                                                          }
                                                          print(controller
                                                              .ListProduct);
                                                          print(controller
                                                              .ListFinal);
                                                          controller.update();
                                                        }),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(
                                                height: heightApp * 0.02,
                                              ),
                                      ],
                                    ),
                                  ),
                                  ListView(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    children:
                                        controller.ListProduct.map((document) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 5, top: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
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
                                          closeOnScroll: false,
                                          // create a key
                                          key: const ValueKey('key'),

                                          startActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            children: [
                                              InkWell(
                                                onTap: () {
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
                                                          content: Text(
                                                              "Are you sure to delete this service?"
                                                                  .tr),
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
                                                                totalAmount -= (int.parse(
                                                                        controller
                                                                            .count) *
                                                                    double.parse(
                                                                        controller
                                                                            .unit));
                                                                totalAmountwithtax -=
                                                                    (totalAmount +
                                                                        (totalAmount *
                                                                            controller.tax));
                                                                controller
                                                                        .totalproduct -=
                                                                    double.parse(
                                                                        controller
                                                                            .totallist);
                                                                print(
                                                                    totalAmountwithtax);
                                                                controller
                                                                        .ListProduct
                                                                    .remove(
                                                                        document);
                                                                controller
                                                                        .ListFinal
                                                                    .remove(
                                                                        document);
                                                                controller
                                                                    .update();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                print(
                                                                    totalAmount);
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: Text(
                                                                  "cancel".tr),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                      'assets/images/trash.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "product name".tr,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.01,
                                                        ),
                                                        Text(
                                                          document[
                                                              'product name'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Count".tr,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.01,
                                                        ),
                                                        Text(
                                                          controller.count =
                                                              document[
                                                                  'ItemCount'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "unit price".tr,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.01,
                                                        ),
                                                        Text(
                                                          controller.unit =
                                                              document[
                                                                  'PurchasePrice'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Total".tr,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.01,
                                                        ),
                                                        Text(
                                                          controller.totallist =
                                                              document[
                                                                  'TotalAmount'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  controller.ListProduct.isNotEmpty
                                      ? MainButton(
                                          text: "printing".tr,
                                          press: () async {
                                            //                                           print("-----------Total-------------");
                                            //                                           print(controller.totallist);
                                            // //                                        controller.totalproduct += double.parse(        controller.totallist);
                                            // //  print(controller.totalproduct);

                                            //                                           print(controller.totalproduct);
                                            //                                           print(totalAmount
                                            //                                               .toString()); // total before discount
                                            //                                           print(AllTotal.toString());
                                            //                                           print(
                                            //                                               discunt); // total after discount
                                            //                                           print(
                                            //                                               discountwittax); //totalwithtax
                                            //                                           print(
                                            //                                               totalAmountwithtax); // total before discount
                                            //                                           print(
                                            //                                               controller.totalwithtaxproduct);
                                            await controller
                                                .RequestAddInvoicePurchase();

                                            controller
                                                .ADDitemFormKey2.currentState!
                                                .reset();
                                            if (controller.statusCode ==
                                                'true') {
                                              final pdfFile = lang.appLocale ==
                                                      'en'
                                                  ? await PdfPurchase.generate(
                                                      controller.companyEName,
                                                      controller.supplierEName,
                                                      controller.addres
                                                          .toString(),
                                                      controller.registerDate
                                                          .toString(),
                                                      // controller.taxNumber
                                                      //     .toString(),
                                                      // controller.taxValue
                                                      //     .toString(),
                                                      // controller
                                                      //     .commercialRecordNo
                                                      //     .toString(),
                                                      controller.totaldicount
                                                          .toString(),
                                                      controller.invoiceId
                                                          .toString(),
                                                      controller.totalproduct,

                                                      controller.totalwithtaxproductPdf
                                                                  .toString() ==
                                                              '0.00'
                                                          ? controller
                                                              .totalwithtaxproductPdf
                                                              .toString()
                                                          : controller
                                                              .totalwithtaxproductPdf
                                                              .toStringAsFixed(
                                                                  2)
                                                              .replaceAll(
                                                                  '-', '')
                                                              .toString(),
                                                      controller.ListProduct
                                                          .map((document) => [
                                                                document[
                                                                    'product name'],
                                                                document[
                                                                    'ItemCount'],
                                                                document[
                                                                    'PurchasePrice'],
                                                                document[
                                                                    'TotalAmount'],
                                                                document[
                                                                    'Discount']
                                                              ]).toList(),
                                                    )
                                                  : await PdfPurchase.generate(
                                                      controller.companyAName
                                                          .toString(),
                                                      controller.supplierAName
                                                          .toString(),
                                                      controller.addres
                                                          .toString(),
                                                      controller.registerDate
                                                          .toString(),
                                                      // controller.taxNumber
                                                      //     .toString(),
                                                      // controller.taxValue
                                                      //     .toString(),
                                                      // controller
                                                      //     .commercialRecordNo
                                                      //     .toString(),
                                                      controller.totaldicount
                                                          .toString(),
                                                      controller.invoiceId
                                                          .toString(),
                                                      controller.totalproduct,
                                                      controller
                                                          .totalwithtaxproductPdf,
                                                      controller.ListProduct
                                                          .map((document) => [
                                                                document[
                                                                    'product name'],
                                                                document[
                                                                    'ItemCount'],
                                                                document[
                                                                    'PurchasePrice'],
                                                                document[
                                                                    'TotalAmount'],
                                                                document[
                                                                    'Discount']
                                                              ]).toList());

                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              PdfApi.openFile(pdfFile);
                                            } else {
                                              Navigator.pop(context);

                                              showErrorSnackBar(
                                                  'There is an error, please try again'
                                                      .tr);
                                            }
                                          })
                                      : Container(),
                                  SizedBox(
                                    height: heightApp * 0.04,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // second tab bar viiew widget
                          if (controller.ListProduct.isNotEmpty)
                            Center(
                                child: MainButton(
                                    text: "View invoice".tr,
                                    press: () async {
                                      await controller
                                          .RequestAddInvoicePurchase();

                                      controller.ADDitemFormKey2.currentState!
                                          .reset();

                                      if (controller.statusCode == 'true') {
                                        final pdfFile = lang.appLocale == 'en'
                                            ? await PdfPurchase.generate(
                                                controller.companyEName,
                                                controller.supplierEName,
                                                controller.addres.toString(),
                                                controller.registerDate
                                                    .toString(),
                                                // controller.taxNumber.toString(),
                                                // controller.taxValue.toString(),
                                                // controller.commercialRecordNo
                                                //     .toString(),
                                                controller.totaldicount
                                                    .toString(),
                                                controller.invoiceId.toString(),
                                                controller.totalproduct,
                                                controller
                                                    .totalwithtaxproductPdf,
                                                controller.ListProduct.map(
                                                    (document) => [
                                                          document[
                                                              'product name'],
                                                          document['ItemCount'],
                                                          document[
                                                              'PurchasePrice'],
                                                          document[
                                                              'TotalAmount'],
                                                          document['Discount']
                                                        ]).toList())
                                            : await PdfPurchase.generate(
                                                controller.companyAName,
                                                controller.supplierAName,
                                                controller.addres,
                                                controller.registerDate,
                                                // controller.taxNumber,
                                                // controller.taxValue,
                                                // controller.commercialRecordNo,
                                                controller.totaldicount
                                                    .toString(),
                                                controller.invoiceId,
                                                controller.totalproduct,
                                                controller
                                                    .totalwithtaxproductPdf,
                                                controller.ListProduct.map(
                                                    (document) => [
                                                          document[
                                                              'product name'],
                                                          document['ItemCount'],
                                                          document[
                                                              'PurchasePrice'],
                                                          document[
                                                              'TotalAmount'],
                                                          document['Discount']
                                                        ]).toList());
                                        controller.ListProduct.clear();
                                        ListUser.clear();
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        PdfApi.openFile(pdfFile);
                                      } else {
                                        Navigator.pop(context);
                                        showErrorSnackBar(
                                            'There is an error, please try again'
                                                .tr);
                                      }
                                    }))
                          else
                            Center(
                              child: Text("There is no invoice to display".tr,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                        ]),
                      )
                    ]));
              }),
        ));
  }
}
