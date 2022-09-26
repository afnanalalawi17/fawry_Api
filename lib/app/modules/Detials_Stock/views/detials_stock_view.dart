import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detials_stock_controller.dart';

class DetialsStockView extends GetView<DetialsStockController> {
  const DetialsStockView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
         centerTitle: true,

        title:Text(
              'Stock'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            leading:BackButton( color: Theme.of(context).primaryColorDark,onPressed: (){
                  Navigator.of(context).pop(); 
            },)
      ),
      body: 
      GetBuilder<DetialsStockController>(
          init: DetialsStockController(),
          initState: (_) {},
          builder: (_) {
            return 
           SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                                                   Get.toNamed(Routes.DETIALS_STOCK_PRODUCT);
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Report by product".tr,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            IconButton(
                                onPressed: () {
                                Get.toNamed(Routes.DETIALS_STOCK_PRODUCT);
                                },
                                icon: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).primaryColorDark)),
                          ],
                        ),
                      ),
                    ),
                  ), GestureDetector(
                    onTap: () {
                       Get.toNamed(Routes.DETIALS_STOCK_COMPREHENSIVE);
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "comprehensive report".tr,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.DETIALS_STOCK_COMPREHENSIVE);
                                },
                                icon: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).primaryColorDark)),
                          ],
                        ),
                      ),
                    ),
                  ), 
                  
                   
                ]),
              ),
            );
          }),
    );
  }
}
