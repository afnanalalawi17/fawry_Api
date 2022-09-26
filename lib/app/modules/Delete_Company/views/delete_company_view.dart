import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Services/RegisterSupplier.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../controllers/delete_company_controller.dart';

class DeleteCompanyView extends GetView<DeleteCompanyController> {
  @override
  final controller = Get.put(DeleteCompanyController());
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
              "Delete Company".tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            leading: BackButton(
              color: Theme.of(context).primaryColorDark,
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: GetBuilder<DeleteCompanyController>(
              init: DeleteCompanyController(),
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
  child:   Column(
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
                                              lang.appLocale=='en'
                                          ?   "Swipe left to delete activity".tr
                                                  .tr:"Swipe right to delete activity".tr
                                                  .tr,
                                              style:TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold,color: kblack),
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
                                  itemCount: controller.categoriesLis.length,
                                  itemBuilder: (context, index) {
                                    return Container(
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
                                      child: Slidable(
                                        // create a key

                                        key: const ValueKey('key'),
                                        startActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            InkWell(
                                              onTap: () {
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
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                              "Are you sure to delete this service?"
                                                                  .tr),
                                                        ),
                                                        actionsAlignment:
                                                            MainAxisAlignment.center,
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: Text(
                                                              "yes".tr,
                                                              style: TextStyle(
                                                                  color: Colors.red),
                                                            ),
                                                            onPressed: () {
                                                              controller.id =
                                                                  controller
                                                                      .categoriesLis[
                                                                          index]
                                                                      .companyID;
                                                              Navigator.of(context)
                                                                  .pop();

                                                              controller
                                                                  .RequestDeleteCompany(
                                                                      controller.id);
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text("cancel".tr),
                                                            onPressed: () {
                                                              Navigator.of(context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                height: 100,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                width: 85,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                     lang.appLocale ==
                                                            'en'
                                                        ? BorderRadius.horizontal(
                                                            left: Radius.circular(12),
                                                          )
                                                        : BorderRadius.horizontal(
                                                            right:
                                                                Radius.circular(12),
                                                          )
                                                          
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        lang.appLocale == 'en'
                                                            ? controller
                                                                .categoriesLis[index]
                                                                .companyEName
                                                                .toString()
                                                            : controller
                                                                .categoriesLis[index]
                                                                .companyAName
                                                                .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5),
                                                    Text('',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5),
                                                  ],
                                                ),
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
                              "There is no registered activity".tr,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ));
              }),
        ),
      ),
    );
  }
}
