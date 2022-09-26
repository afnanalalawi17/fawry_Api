import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/archives_controller.dart';

class ArchivesView extends GetView<ArchivesController> {
  const ArchivesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
       
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
            automaticallyImplyLeading: false,
            
            title: Text(
                  'archives'.tr,
                 style: TextStyle(
                             
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                ),
            leading:BackButton( color: Theme.of(context).primaryColorDark,onPressed: (){
               Navigator.of(context).pop();
            },),
            
            
            
            
            
            
          
          ),
      body: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [SizedBox(height: heightApp*0.02,),
                          SizedBox(
                             height: heightApp * 0.05+2,
                            child: AppBar(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: kblack),
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 2,
                              backgroundColor: Colors.white,
                              bottom: TabBar(
                                indicatorPadding: EdgeInsets.only(
                                    top: 2,
                                    right: 2,
                                    left: 2,
                                    bottom: 2),
                                // onTap: controller.selectTab,
                                //  labelPadding: EdgeInsets.only(left: 20,right: 20),
                                // isScrollable: true,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).primaryColor,
                                ),
                                labelColor: kwhite,
                                unselectedLabelColor:
                                    Theme.of(context).primaryColor,
                                // indicatorSize: TabBarIndicatorSize.tab,
                                indicatorColor: kgreyLight,
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
                                      'sales invoices'.tr,
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
                          ),
                          SizedBox(
                            height: heightApp * 0.012,
                          ),
                          Expanded(
                            child: TabBarView(children: [
                     ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: heightApp * 0.01,
                            );
                          },
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 33,
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
                                          Text("activity name",
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
                                                // print(controller.categoriesLis[index].invoiceDetails.length);

                                                //           Get.toNamed(Routes.SHOW_INVOICES, arguments:

                                                //            [

                                                //  controller.categoriesLis[index].activityID.toString(),
                                                //  controller.categoriesLis[index].activityName.toString(),
                                                //  controller.categoriesLis[index].address.toString(),
                                                //  controller.categoriesLis[index].taxNumber.toString(),
                                                //  controller.categoriesLis[index].activityLogo.toString(),
                                                //  controller.categoriesLis[index].invoiceID.toString(),
                                                //  controller.categoriesLis[index].totalAmount.toString(),
                                                //  controller.categoriesLis[index].totalIncludingTax.toString(),
                                                //  controller.categoriesLis[index].registerDate.toString(),
                                                //  controller.categoriesLis[index].registerTime.toString(),
                                                //  controller.categoriesLis[index].invoiceDetails
                                                //  controller.InvoiceDetailsList[index].itemName.toString(),
                                                //  controller.InvoiceDetailsList[index].itemID.toString(),
                                                //  controller.InvoiceDetailsList[index].count.toString(),
                                                //  controller.InvoiceDetailsList[index].amount.toString(),
                                                //  controller.InvoiceDetailsList[index].invoiceID.toString(),
                                                //  controller.InvoiceDetailsList[index].itemDesc.toString(),

                                                //  ]
                                                //  );
                                              },
                                              child: Center(
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
                                        ]),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Date",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        Row(
                                          children: [
                                            Text("totalIncludingTax".tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                            Text("Total with VAT",
                                                style: Theme.of(context)
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

                              // second tab bar viiew widget
                            ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: heightApp * 0.01,
                            );
                          },
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 33,
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
                                        Text("activity name",
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
                                          // print(controller.categoriesLis[index].invoiceDetails.length);

                                          //           Get.toNamed(Routes.SHOW_INVOICES, arguments:

                                          //            [

                                          //  controller.categoriesLis[index].activityID.toString(),
                                          //  controller.categoriesLis[index].activityName.toString(),
                                          //  controller.categoriesLis[index].address.toString(),
                                          //  controller.categoriesLis[index].taxNumber.toString(),
                                          //  controller.categoriesLis[index].activityLogo.toString(),
                                          //  controller.categoriesLis[index].invoiceID.toString(),
                                          //  controller.categoriesLis[index].totalAmount.toString(),
                                          //  controller.categoriesLis[index].totalIncludingTax.toString(),
                                          //  controller.categoriesLis[index].registerDate.toString(),
                                          //  controller.categoriesLis[index].registerTime.toString(),
                                          //  controller.categoriesLis[index].invoiceDetails
                                          //  controller.InvoiceDetailsList[index].itemName.toString(),
                                          //  controller.InvoiceDetailsList[index].itemID.toString(),
                                          //  controller.InvoiceDetailsList[index].count.toString(),
                                          //  controller.InvoiceDetailsList[index].amount.toString(),
                                          //  controller.InvoiceDetailsList[index].invoiceID.toString(),
                                          //  controller.InvoiceDetailsList[index].itemDesc.toString(),

                                          //  ]
                                          //  );
                                        },
                                        child: Center(
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

                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Date",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        Row(
                                          children: [
                                            Text("totalIncludingTax".tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                            Text("Total with VAT",
                                                style: Theme.of(context)
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
                          })
                            ]),
                          )
                        ]))));
             
        
  }
}
