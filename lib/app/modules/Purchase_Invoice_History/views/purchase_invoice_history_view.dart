import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/document/HelperPdf.dart';
import 'package:fawry_app/app/document/PdfPurchase.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:intl/intl.dart';

import '../controllers/purchase_invoice_history_controller.dart';

class PurchaseInvoiceHistoryView
    extends GetView<PurchaseInvoiceHistoryController> {
  final lang = Get.put(AppLanguageController());
    @override
      final controller = Get.put(PurchaseInvoiceHistoryController());
  final _debouncer = Debouncer();

  var id;
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: WillPopScope(
            onWillPop: () async => false,
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
              Get.offAndToNamed(Routes.SELECT_COMPANY_PURCHASE);
            },
          ),
        ),
        body: GetBuilder<PurchaseInvoiceHistoryController>(
          init: PurchaseInvoiceHistoryController(),
          initState: (_) {},
          builder: (_) {
            return 
            
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.companyID == null
                        ? Column(
                            children: [
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
                                      'Please select a company to show Invoices'
                                          .tr,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: heightApp * 0.02,
                              ),
                            ],
                          )
                        : Container(),
                    // DropdownButtonFormField(
                    //   // key: controller.key,
                    //   //  value: controller.ActivityList[0],
                    //   iconEnabledColor: Theme.of(context).primaryColor,
                    //   iconDisabledColor: Theme.of(context).primaryColor,
                    //   style: TextStyle(color: kblack),
                    //   dropdownColor: kwhite,

                    //   //  key: controller.ADDdropFormKey,
                    //   validator: (value) {
                    //     print(value.runtimeType);
                    //     if (value == null) {
                    //       return 'Please select a Company'.tr;
                    //     }

                    //     return null;
                    //   },
                    //   isDense: true,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,

                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.all(12),
                    //     filled: true,
                    //     fillColor:
                    //         Theme.of(context).primaryColor.withOpacity(.20),
                    //     hintText: lang.appLocale == 'en'
                    //         ? controller.companyEName ?? 'Company selection'.tr
                    //         : controller.companyAName ?? 'Company selection'.tr,
                    //     hintStyle: TextStyle(
                    //         color: kblack,
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.w300),
                    //     border: const OutlineInputBorder(),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide(
                    //         color: Theme.of(context).primaryColor,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide(
                    //         color: Theme.of(context).primaryColor,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //     errorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //     focusedErrorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //   ),
                    //   items: lang.appLocale == 'en'
                    //       ? controller.ActivityList.map((value) {
                    //           return DropdownMenuItem<int>(
                    //             value: value.companyID,
                    //             child: Text(value.companyEName!),
                    //             onTap: () {
                    //               controller.companyIDSearch = value.companyID;
                    //               controller.companyEName = value.companyEName;
                    //               print(controller.companyID);
                    //               controller.fetchInvoice();
                    //             },
                    //           );
                    //         }).toList()
                    //       : controller.ActivityList.map((value) {
                    //           return DropdownMenuItem<int>(
                    //             value: value.companyID,
                    //             child: Text(value.companyAName!),
                    //             onTap: () {
                    //               controller.companyIDSearch = value.companyID;

                    //               controller.companyAName = value.companyAName;
                    //               controller.fetchInvoice();
                    //             },
                    //           );
                    //         }).toList(),
                    //   onChanged: (newValue) {},

                    //   isExpanded: true,
                    // ),
                    // SizedBox(
                    //   height: heightApp * 0.01,
                    // ),
                    Obx(() => controller.isLoading.value == true
                        ? Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                ),
                                Custom_ProgressIndicator()
                              ],
                            ),
                          )
                        : controller.categoriesLis.isNotEmpty
                            ? sugg.isEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: TextField(
                                                      controller:
                                                          controller
                                                              .searchController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'search..'.tr,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      12.0),
                                                              filled: true,
                                                              fillColor: Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      .20),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.search,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 28.0,
                                                                // textDirection: TextDirection.ltr,
                                                              ),
                                                              hintStyle: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .hintColor,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300)),
                                                      textAlign:
                                                          TextAlign.start,
                                                      onChanged: (string) {
                                                        search(string);
                                                      }),
                                                ),
                                                SizedBox(
                                                  width: widthApp * 0.01,
                                                ),
                                                IconButton(
                                                    onPressed: () {
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
                                                              content: Form(
                                                                key: controller
                                                                    .datalist,
                                                                child: Column(
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Text(
                                                                            "Please enter a date range to view invoices issued within the specified range".tr)),
                                                                    SizedBox(
                                                                      height:
                                                                          heightApp *
                                                                              0.03,
                                                                    ),
                                                                    TextFormField(
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                      controller:
                                                                          controller
                                                                              .fromexpiryDateController,
                                                                      decoration: InputDecoration(
                                                                          hintText: "From Date".tr,
                                                                          contentPadding: const EdgeInsets.all(12.0),
                                                                          filled: true,
                                                                          fillColor: Theme.of(context).primaryColor.withOpacity(.20),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          errorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          hintStyle: TextStyle(color: Theme.of(context).hintColor, fontSize: 13, fontWeight: FontWeight.w300)),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      validator:
                                                                          (value) {
                                                                        return controller
                                                                            .validatedata(value!);
                                                                      },
                                                                      onTap:
                                                                          () {
                                                                        showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              DateTime.now(),
                                                                          firstDate:
                                                                              DateTime.parse('2022-05-03'),
                                                                          lastDate:
                                                                              DateTime.parse('2025-05-03'),
                                                                        ).then(
                                                                            (value) {
                                                                          print(
                                                                              DateFormat.yMMMd().format(value!));
                                                                          controller
                                                                              .fromexpiryDateController
                                                                              .text = DateFormat.yMMMd().format(value);
                                                                        });
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          heightApp *
                                                                              0.01,
                                                                    ),
                                                                    TextFormField(
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                      controller:
                                                                          controller
                                                                              .toexpiryDateController,
                                                                      decoration: InputDecoration(
                                                                          hintText: "To Date".tr,
                                                                          contentPadding: const EdgeInsets.all(12.0),
                                                                          filled: true,
                                                                          fillColor: Theme.of(context).primaryColor.withOpacity(.20),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          errorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          hintStyle: TextStyle(color: Theme.of(context).hintColor, fontSize: 13, fontWeight: FontWeight.w300)),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      validator:
                                                                          (value) {
                                                                        return controller
                                                                            .validatedata(value!);
                                                                      },
                                                                      onTap:
                                                                          () {
                                                                        showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              DateTime.now(),
                                                                          firstDate:
                                                                              DateTime.parse('2022-05-03'),
                                                                          lastDate:
                                                                              DateTime.parse('2025-05-03'),
                                                                        ).then(
                                                                            (value) {
                                                                          print(
                                                                              DateFormat.yMMMd().format(value!));
                                                                          controller
                                                                              .toexpiryDateController
                                                                              .text = DateFormat.yMMMd().format(value);
                                                                        });
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          heightApp *
                                                                              0.03,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Flexible(
                                                                            child: MainButton(
                                                                                text: "confirm",
                                                                                press: () {
                                                                                  if (controller.datalist.currentState!.validate()) {
                                                                                    controller.fetchInvoicesPurchaseByDate();
                                                                                    Navigator.pop(context);
                                                                                  }
                                                                                })),
                                                                        SizedBox(
                                                                          width:
                                                                              widthApp * 0.02,
                                                                        ),
                                                                        Flexible(
                                                                            child:
                                                                                SizedBox(
                                                                          height:
                                                                              heightApp * 0.066,
                                                                          child:
                                                                              ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              primary: Colors.red,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              controller.fromexpiryDateController.text = '';
                                                                              controller.toexpiryDateController.text = '';

                                                                              controller.fetchInvoice(id);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "cancel".tr,
                                                                                style: Theme.of(context).textTheme.button,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ))
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    icon: Icon(
                                                      Icons.filter_alt,
                                                      color: Theme.of(context)
                                                          .primaryColorDark,
                                                      size: 30,
                                                    )),
                                                controller.fromexpiryDateController
                                                                .text
                                                                .toString() !=
                                                            '' ||
                                                        controller
                                                                .toexpiryDateController
                                                                .text
                                                                .toString() !=
                                                            ''
                                                    ? IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .fromexpiryDateController
                                                              .text = '';
                                                          controller
                                                              .toexpiryDateController
                                                              .text = '';
                                                          controller.fetchInvoice(
                                                              controller
                                                                  .companyIDSearch);
                                                        },
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark,
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.01,
                                            ),
                                            Text(
                                              "The search is by the name of the activity, store, or invoice number"
                                                  .tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                          ]),
                                      ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: heightApp * 0.01,
                                            );
                                          },
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount:
                                              controller.categoriesLis.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20),
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
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              lang.appLocale ==
                                                                      'en'
                                                                  ? Text(
                                                                      controller
                                                                          .categoriesLis[
                                                                              index]
                                                                          .companyEName
                                                                          .toString(),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline5)
                                                                  : Text(
                                                                      controller
                                                                          .categoriesLis[
                                                                              index]
                                                                          .companyAName
                                                                          .toString(),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline5)
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              // Icon(
                                                              //   Icons
                                                              //       .favorite,
                                                              //   size: 30,
                                                              //   color:
                                                              //       kgreyLight,
                                                              // ),
                                                              SizedBox(
                                                                width:
                                                                    widthApp *
                                                                        0.02,
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.044,
                                                                //width: widthApp * 0.28,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Theme.of(
                                                                            context)
                                                                        .primaryColorDark,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12)),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // print(controller.categoriesLis[index].itemHistory);

                                                                    // print( [controller.categoriesLis[index].itemHistory][0]
                                                                    //         .map((document) => [
                                                                    //       document.itemEName.toString(),

                                                                    //               document.itemCount.toString(),
                                                                    //                 document.itemPrice.toString(),
                                                                    //                     document.itemID.toString()
                                                                    //             ])
                                                                    //         .toList());
                                                                    final pdfFile = lang.appLocale ==
                                                                            'en'
                                                                        ? await PdfPurchase.generate(
                                                                            controller.categoriesLis[index].companyEName.toString(),
                                                                            controller.categoriesLis[index].supplier == [] ? 'djjkdjkd'.toString() : controller.categoriesLis[index].supplier[0].supplierEName.toString(),
                                                                            controller.categoriesLis[index].address.toString(),
                                                                            controller.categoriesLis[index].registerDate.toString(),
                                                                           '0.0',
                                                                            controller.categoriesLis[index].purchaseID.toString(),
                                                                            controller.categoriesLis[index].totalAmount.toString(),
                                                                            controller.categoriesLis[index].totalIncludingTax.toString() == controller.categoriesLis[index].totalAmount.toString() ? '0.0' : controller.categoriesLis[index].totalIncludingTax.toString(),
                                                                            [controller.categoriesLis[index].itemHistory][0]
                                                                                .map((document) => [
                                                                                      document.itemEName.toString(),
                                                                                      document.itemCount.toString(),
                                                                                      document.purchasePrice.toString(),
                                                                                         double.parse( document.itemCount.toString()) * double.parse(   document.purchasePrice.toString())
                                                                                    ])
                                                                                .toList())
                                                                        : await PdfPurchase.generate(
                                                                            controller.categoriesLis[index].companyEName.toString(),
                                                                            controller.categoriesLis[index].supplier == [] ? 'djjkdjkd' : controller.categoriesLis[index].supplier[0].supplierAName.toString(),
                                                                            controller.categoriesLis[index].address.toString(),
                                                                            controller.categoriesLis[index].registerDate.toString(),
                                                                           '0.0',
                                                                            controller.categoriesLis[index].itemHistoryID.toString(),
                                                                            controller.categoriesLis[index].totalAmount.toString(),
                                                                            controller.categoriesLis[index].totalIncludingTax.toString() == controller.categoriesLis[index].totalAmount.toString() ? '0.0' : controller.categoriesLis[index].totalIncludingTax.toString(),
                                                                            [controller.categoriesLis[index].itemHistory][0]
                                                                                .map((document) => [
                                                                                      document.itemEName.toString(),
                                                                                      document.itemCount.toString(),
                                                                                      document.purchasePrice.toString(),
                                                                                     double.parse( document.itemCount.toString()) * double.parse(   document.purchasePrice.toString())
                                                                                    ])
                                                                                .toList());

                                                                    Navigator.pop(
                                                                        context);
                                                                    // Navigator.pop(
                                                                    //     context);
                                                                    PdfApi.openFile(
                                                                        pdfFile);
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Show".tr,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Theme.of(context)
                                                                            .primaryColorLight,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ]),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            controller
                                                                .categoriesLis[
                                                                    index]
                                                                .registerDate
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "Total Amount"
                                                                    .tr,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5),
                                                            Text(
                                                                controller
                                                                    .categoriesLis[
                                                                        index]
                                                                    .totalIncludingTax
                                                                    .toString(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: TextField(
                                                      controller:
                                                          controller
                                                              .searchController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  'search..'.tr,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      12.0),
                                                              filled: true,
                                                              fillColor: Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      .20),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.search,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 28.0,
                                                                // textDirection: TextDirection.ltr,
                                                              ),
                                                              hintStyle: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .hintColor,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300)),
                                                      textAlign:
                                                          TextAlign.start,
                                                      onChanged: (string) {
                                                        search(string);
                                                      }),
                                                ),
                                                SizedBox(
                                                  width: widthApp * 0.01,
                                                ),
                                                IconButton(
                                                    onPressed: () {
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
                                                              content: Form(
                                                                key: controller
                                                                    .datalist,
                                                                child: Column(
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Text(
                                                                            "Please enter a date range to view invoices issued within the specified range".tr)),
                                                                    SizedBox(
                                                                      height:
                                                                          heightApp *
                                                                              0.03,
                                                                    ),
                                                                    TextFormField(
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                      controller:
                                                                          controller
                                                                              .fromexpiryDateController,
                                                                      decoration: InputDecoration(
                                                                          hintText: "From Date".tr,
                                                                          contentPadding: const EdgeInsets.all(12.0),
                                                                          filled: true,
                                                                          fillColor: Theme.of(context).primaryColor.withOpacity(.20),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          errorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          hintStyle: TextStyle(color: Theme.of(context).hintColor, fontSize: 13, fontWeight: FontWeight.w300)),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      validator:
                                                                          (value) {
                                                                        return controller
                                                                            .validatedata(value!);
                                                                      },
                                                                      onTap:
                                                                          () {
                                                                        showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              DateTime.now(),
                                                                          firstDate:
                                                                              DateTime.parse('2022-05-03'),
                                                                          lastDate:
                                                                              DateTime.parse('2025-05-03'),
                                                                        ).then(
                                                                            (value) {
                                                                          print(
                                                                              DateFormat.yMMMd().format(value!));
                                                                          controller
                                                                              .fromexpiryDateController
                                                                              .text = DateFormat.yMMMd().format(value);
                                                                        });
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          heightApp *
                                                                              0.01,
                                                                    ),
                                                                    TextFormField(
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                      controller:
                                                                          controller
                                                                              .toexpiryDateController,
                                                                      decoration: InputDecoration(
                                                                          hintText: "To Date".tr,
                                                                          contentPadding: const EdgeInsets.all(12.0),
                                                                          filled: true,
                                                                          fillColor: Theme.of(context).primaryColor.withOpacity(.20),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          errorBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.red, width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          hintStyle: TextStyle(color: Theme.of(context).hintColor, fontSize: 13, fontWeight: FontWeight.w300)),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      validator:
                                                                          (value) {
                                                                        return controller
                                                                            .validatedata(value!);
                                                                      },
                                                                      onTap:
                                                                          () {
                                                                        showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              DateTime.now(),
                                                                          firstDate:
                                                                              DateTime.parse('2022-05-03'),
                                                                          lastDate:
                                                                              DateTime.parse('2025-05-03'),
                                                                        ).then(
                                                                            (value) {
                                                                          print(
                                                                              DateFormat.yMMMd().format(value!));
                                                                          controller
                                                                              .toexpiryDateController
                                                                              .text = DateFormat.yMMMd().format(value);
                                                                        });
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          heightApp *
                                                                              0.03,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Flexible(
                                                                            child: MainButton(
                                                                                text: "confirm",
                                                                                press: () {
                                                                                  if (controller.datalist.currentState!.validate()) {
                                                                                    controller.fetchInvoicesPurchaseByDate();
                                                                                    Navigator.pop(context);
                                                                                  }
                                                                                })),
                                                                        SizedBox(
                                                                          width:
                                                                              widthApp * 0.02,
                                                                        ),
                                                                        Flexible(
                                                                            child:
                                                                                SizedBox(
                                                                          height:
                                                                              heightApp * 0.066,
                                                                          child:
                                                                              ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              primary: Colors.red,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              controller.fromexpiryDateController.text = '';
                                                                              controller.toexpiryDateController.text = '';

                                                                              controller.fetchInvoice(id);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "cancel".tr,
                                                                                style: Theme.of(context).textTheme.button,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ))
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    icon: Icon(
                                                      Icons.filter_alt,
                                                      color: Theme.of(context)
                                                          .primaryColorDark,
                                                      size: 30,
                                                    )),
                                                controller.fromexpiryDateController
                                                                .text
                                                                .toString() !=
                                                            '' ||
                                                        controller
                                                                .toexpiryDateController
                                                                .text
                                                                .toString() !=
                                                            ''
                                                    ? IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .fromexpiryDateController
                                                              .text = '';
                                                          controller
                                                              .toexpiryDateController
                                                              .text = '';
                                                          controller.fetchInvoice(
                                                              controller
                                                                  .companyIDSearch);
                                                        },
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark,
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.01,
                                            ),
                                            Text(
                                              "The search is by the name of the activity, store, or invoice number"
                                                  .tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                          ]),
                                      ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: heightApp * 0.01,
                                            );
                                          },
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: sugg.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20),
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
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              lang.appLocale ==
                                                                      'en'
                                                                  ? Text(
                                                                      sugg[index]
                                                                          .companyEName
                                                                          .toString(),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline5)
                                                                  : Text(
                                                                      sugg[index]
                                                                          .companyAName
                                                                          .toString(),
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline5)
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              // Icon(
                                                              //   Icons
                                                              //       .favorite,
                                                              //   size: 30,
                                                              //   color:
                                                              //       kgreyLight,
                                                              // ),
                                                              SizedBox(
                                                                width:
                                                                    widthApp *
                                                                        0.02,
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.044,
                                                                //width: widthApp * 0.28,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Theme.of(
                                                                            context)
                                                                        .primaryColorDark,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12)),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // final pdfFile = lang.appLocale ==
                                                                    //             'en'
                                                                    //         ? await PdfPurchase.generate(
                                                                    // controller.sugg[index].companyEName.toString(),
                                                                    // controller.sugg[index].supplier[0].supplierEName.toString(),
                                                                    // controller.sugg[index].address.toString(),
                                                                    // controller.sugg[index].registerDate.toString(),
                                                                    // controller.sugg[index].itemHistoryID.toString(),
                                                                    // controller.sugg[index].totalAmount.toString(),
                                                                    // controller.totalwithtaxproduct,
                                                                    // ListProduct.map((document) => [
                                                                    //           document['product name'],
                                                                    //           document['Count'],
                                                                    //           document['selling price'],
                                                                    //           document['Total'],
                                                                    //         ]).toList())
                                                                    // : await PdfPurchase.generate(
                                                                    //     controller.sugg[index].companyAName.toString(),
                                                                    //     controller.sugg[index].supplier[0].supplierAName.toString(),
                                                                    //    controller.sugg[index].address.toString(),
                                                                    //     controller.sugg[index].registerDate.toString(),
                                                                    //         controller.sugg[index].itemHistoryID.toString(),
                                                                    //         controller.sugg[index].totalAmount.toString(),
                                                                    //         controller.totalwithtaxproduct,
                                                                    //         ListProduct.map((document) => [
                                                                    //               document['product name'],
                                                                    //               document['Count'],
                                                                    //               document['selling price'],
                                                                    //               document['Total'],
                                                                    //             ]).toList());

                                                                    // Navigator.pop(
                                                                    //     context);
                                                                    // Navigator.pop(
                                                                    //     context);
                                                                    // PdfApi.openFile(
                                                                    //     pdfFile);
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Show".tr,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Theme.of(context)
                                                                            .primaryColorLight,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ]),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            sugg[index]
                                                                .registerDate
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "Total Amount"
                                                                    .tr,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5),
                                                            Text(
                                                                sugg[index]
                                                                    .totalIncludingTax
                                                                    .toString(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  )
                            : Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.33,
                                    ),
                                    Text(
                                      'No invoices'.tr,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ))
                  ],
                ),
              ),
            );
          },
        ))));
    //   ),
    // );
  }

  List sugg = [];

  search(String query) {
    sugg = [];
    final suggestion = controller.categoriesLis.where((element) {
//       print(element.activityName);
// final titleLower = element.companyID.toString();
//       final authorLower = lang.appLocale=='en'
//       ?
//       element.companyEName.toLowerCase():`
//       element.companyAName.toLowerCase();
      final totalLower = element.totalIncludingTax.toString();

      final searchLower = query;
// print( totalLower.contains(searchLower));
      return element.totalIncludingTax.toString().contains(searchLower);
    }).toList();
    sugg = suggestion;

    print(sugg);
    controller.update();
  }
}
