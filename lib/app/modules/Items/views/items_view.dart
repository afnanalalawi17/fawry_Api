import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Services/RegisterSupplier.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../controllers/items_controller.dart';

class ItemsView extends GetView<ItemsController> {
  final lang = Get.put(AppLanguageController());
  @override
  final controller = Get.put( ItemsController()); 
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
              title:  Text(
                            "Categories".tr,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
              leading:BackButton( color: Theme.of(context).primaryColorDark,onPressed: (){
                controller.companyID==null;
                 Get.offAndToNamed(Routes.BASIC,);
              },)
              
              
           
            
            ),
            body: GetBuilder<ItemsController>(
                init: ItemsController(),
                initState: (_) {},
                builder: (_) {
                  return Obx(() => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ))
                      : controller.itemsLis.isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: heightApp * 0.01,
                                );
                              },
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller.itemsLis.length,
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            lang.appLocale == 'en'
                                          ?  Text(
                                                controller
                                                    .itemsLis[index].itemTypeEName
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5):Text(
                                                controller
                                                    .itemsLis[index].itemTypeAName
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                             SizedBox(
                                              height: heightApp * 0.044,
                                              //width: widthApp * 0.28,
                                              child: ElevatedButton(
                                                style:
                                                    ElevatedButton.styleFrom(
                                                  primary: Theme.of(context)
                                                      .primaryColorDark,
                                                  shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                ),
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes.SERVICES,
                                                      arguments: [
                                                        controller.companyID,
                                                        controller
                                                            .itemsLis[index]
                                                            .itemTypeID
                                                           
                                                      ]);
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Products".tr,
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
                                          ],
                                        ),
                                      
                                        
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Center(
                              child: Text(
                                "There are no items for this activity".tr,
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
               Get.toNamed(Routes.ADD_ITEM , arguments: [controller.companyID]);
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
