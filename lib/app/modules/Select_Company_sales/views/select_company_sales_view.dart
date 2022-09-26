import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_company_sales_controller.dart';

class SelectCompanySalesView extends GetView<SelectCompanySalesController> {
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
                    "sales invoices".tr,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  leading: BackButton(
                    color: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                body: GetBuilder<SelectCompanySalesController>(
                    init: SelectCompanySalesController(),
                    initState: (_) {},
                    builder: (_) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: [
                              TextField(
                                  //  controller: controller.searchController,
                                  decoration: InputDecoration(
                                      hintText: 'search..'.tr,
                                      contentPadding:
                                          const EdgeInsets.all(12.0),
                                      filled: true,
                                      fillColor: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(.20),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Theme.of(context).primaryColor,
                                        size: 28.0,
                                        // textDirection: TextDirection.ltr,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300)),
                                  textAlign: TextAlign.start,
                                  onChanged: (string) {
                                    search(string);
                                  }),
                              SizedBox(
                                height: heightApp * 0.03,
                              ),
                              Obx(() => controller.isLoading.value == true
                                  ? Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32,
                                          ),
                                          Custom_ProgressIndicator()
                                        ],
                                      ),
                                    )
                                  : controller.categoriesLis.isNotEmpty
                                      ? sugg.isEmpty
                                          ? ListView.separated(
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: heightApp * 0.01,
                                                );
                                              },
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemCount: controller
                                                  .categoriesLis.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .onSelectCat(index);
                                                    Get.offAndToNamed(
                                                        Routes
                                                            .SALES_INVOICE_HISTORY,
                                                        arguments: [
                                                          controller
                                                              .categoriesLis[
                                                                  index]
                                                              .companyID
                                                        ]);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 20),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: controller
                                                                      .selectedCatIndex ==
                                                                  index
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColorDark
                                                              : kwhite),
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 20),
                                                      child: Text(
                                                        lang.appLocale == 'en'
                                                            ? controller
                                                                .categoriesLis[
                                                                    index]
                                                                .companyEName
                                                                .toString()
                                                            : controller
                                                                .categoriesLis[
                                                                    index]
                                                                .companyAName
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorDark),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                          : ListView.separated(
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: heightApp * 0.01,
                                                );
                                              },
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemCount: sugg.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .onSelectCat(index);
                                                    Get.offAndToNamed(
                                                        Routes
                                                            .SALES_INVOICE_HISTORY,
                                                        arguments: [
                                                          sugg[index].companyID
                                                        ]);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 20),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: controller
                                                                      .selectedCatIndex ==
                                                                  index
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColorDark
                                                              : kwhite),
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 20),
                                                      child: Text(
                                                        lang.appLocale == 'en'
                                                            ? sugg[index]
                                                                .companyEName
                                                                .toString()
                                                            : sugg[index]
                                                                .companyAName
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorDark),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                      : Center(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.32,
                                              ),
                                              Text(
                                                'No invoices'.tr,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColorDark,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ))
                            ],
                          ),
                        ),
                      );
                    }))));
  }

  List sugg = [];

  search(String query) {
    sugg = [];
    final suggestion = controller.categoriesLis.where((element) {
      final companyName = lang.appLocale == 'en'
          ? element.companyEName.toString().toLowerCase()
          : element.companyAName.toString().toLowerCase();
      final searchLower = query;
      return lang.appLocale == 'en'
          ? element.companyEName.toString().contains(searchLower)
          : element.companyAName.toString().contains(searchLower);
    }).toList();
    sugg = suggestion;

    print(sugg);
    controller.update();
  }
}
