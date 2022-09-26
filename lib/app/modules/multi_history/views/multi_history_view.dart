import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/multi_history_controller.dart';

class MultiHistoryView extends GetView<MultiHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Invoices".tr,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "Invoices".tr,
        //               style: TextStyle(

        //                   fontSize: 24,
        //                   fontWeight: FontWeight.w700),
        //             ),
        //             // Text(
        //             //   "Includes all invoices".tr,
        //             //   style: TextStyle(

        //             //       fontSize: 14,
        //             //       fontWeight: FontWeight.w500),
        //             // ),
        //           ],
        //         ),GestureDetector(
        //   onTap: () {
        //        //   Navigator.of(context).pop();
        //   },
        //   child: Icon(
        //     Icons.arrow_forward,
        //     color:Colors.transparent,
        //     size: 30,
        //   ),
        // )
        //       ],
        //     ),
        //   ],
        // ),
      ),

      body: GetBuilder<MultiHistoryController>(
          init: MultiHistoryController(),
          initState: (_) {},
          builder: (_) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                           Get.toNamed(Routes.PURCHASE_INVOICE);
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
                              "Purchase invoices".tr,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.PURCHASE_INVOICE);
                                },
                                icon: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).primaryColorDark)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SALES_INVOICES);
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
                              "sales invoices".tr,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.SALES_INVOICES);
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
