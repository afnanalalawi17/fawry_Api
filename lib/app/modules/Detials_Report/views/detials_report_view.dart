import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Model/Circular_Chart_Model.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/modules/Detials_Report/controllers/Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/detials_report_controller.dart';

class DetialsReportView extends GetView<DetialsReportController> {
  final lang = Get.put(AppLanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Reports'.tr,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          leading: BackButton(
            color: Theme.of(context).primaryColorDark,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: GetBuilder<DetialsReportController>(
          init: DetialsReportController(),
          initState: (_) {},
          builder: (_) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  hintText: lang.appLocale == 'en'
                    //         ? controller.companyNameEN ??
                    //             'Company selection'.tr
                    //         : controller.companyNameAR ??
                    //             'Company selection'.tr,
                    // controller.ActivityList.isNotEmpty
                    //   ? Text(
                    //       "*${"Please add your company to be able to view your activity reports".tr}",
                    //       style: TextStyle(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.bold,
                    //           color: Theme.of(context).primaryColorDark),
                    //     )
                    //   : Container(),
                 Obx(
                        () => controller.isLoading.value == false
                            ? 
                    controller.ActivityList.isEmpty
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
                                         "${"Please add your company to be able to view your activity reports".tr}"
                                              .tr,
                                          style:TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold,color: kblack),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                ],
                              )
                        
                        
                        :
                        
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
                                          'Please select a company to show report'
                                              .tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                ],
                              )
                        : Container()
                        
                        :Container()),
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
                        // iconDisabledColor:
                        //     Theme.of(context)
                        //         .primaryColor,
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
                          hintText: lang.appLocale == 'en'
                              ? controller.companyNameEN ??
                                  'Company selection'.tr
                              : controller.companyNameAR ??
                                  'Company selection'.tr,
                          hintStyle: TextStyle(
                              color: kblack,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
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
                                    controller.update();
                                    controller.companyNameEN =
                                        value.companyEName;
                                  },
                                );
                              }).toList()
                            : controller.ActivityList.map((value) {
                                return DropdownMenuItem<int>(
                                  value: value.companyID,
                                  child: Text(value.companyAName!),
                                  onTap: () {
                                    controller.companyID = value.companyID;
                                    controller.companyNameAR =
                                        value.companyAName;
                                    controller.update();
                                  },
                                );
                              }).toList(),
                        onChanged: (newValue) {},
                        onSaved: (newValue) {
                          controller.companyID = newValue;
                          controller.update();
                        },
                        isExpanded: true,
                      ),
                    ),

                    SizedBox(
                      height: heightApp * 0.02,
                    ),
                    controller.companyID != null
                        ? Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: heightApp * 0.01,
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: controller.apa.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              controller.onSelect(index);
                                            },
                                            child: controller.selectedIndex ==
                                                    index
                                                ? Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 10,
                                                                  bottom: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        59,
                                                                        59,
                                                                        152,
                                                                        0.2),
                                                                blurRadius: 30,
                                                                offset: Offset(
                                                                    0, 4),
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorDark
                                                                .withOpacity(
                                                                    .8),
                                                          ),
                                                          child: Icon(
                                                            controller
                                                                .apa[index].img,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 10,
                                                                  bottom: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        59,
                                                                        59,
                                                                        152,
                                                                        0.2),
                                                                blurRadius: 30,
                                                                offset: Offset(
                                                                    0, 4),
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorLight
                                                                .withOpacity(
                                                                    .8),
                                                          ),
                                                          child: Icon(
                                                            controller
                                                                .apa[index].img,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          );
                                        }),
                                  ),
                                ],
                              ),


                              if (controller.selectedIndex == 1)
                                Column(
                                  children: [
                                    Center(
                                      child: SfCircularChart(
                                        title: ChartTitle(
                                            text: "تحليل المبيعات السنوي "),
                                        //   legend:
                                        // Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                                        // tooltipBehavior: controller.tooltipBehavior1,
                                        series: [
                                          PieSeries<DataCircular, String>(
                                            dataSource: controller.circularData,
                                            xValueMapper: (DataCircular data, _) =>
                                                data.itemAName.toString(),
                                            yValueMapper: (DataCircular data, _) =>
                                                data.totalAmount,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    isVisible: true),
                                            enableTooltip: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.08,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: BoxTextField(
                                            controller: controller
                                                .fromexpiryDateController,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2022-05-03'),
                                                lastDate: DateTime.parse(
                                                    '2025-05-03'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd()
                                                    .format(value!));
                                                controller
                                                    .fromexpiryDateController
                                                    .text = DateFormat
                                                        .yMMMd()
                                                    .format(value);
                                              });
                                            },
                                            label: "From Date".tr,
                                            validator: (value) {
                                              // return controller.validateData(value!);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthApp * 0.04,
                                        ),
                                        Flexible(
                                          child: BoxTextField(
                                            controller: controller
                                                .toexpiryDateController,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2022-05-03'),
                                                lastDate: DateTime.parse(
                                                    '2025-05-03'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd()
                                                    .format(value!));
                                                controller
                                                        .toexpiryDateController
                                                        .text =
                                                    DateFormat.yMMMd()
                                                        .format(value);
                                              });
                                            },
                                            label: "To Date".tr,
                                            validator: (value) {
                                              //return controller.validateData(value!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    MainButton(text: "تحميل", press: () {})
                                  ],
                                )
                              else if (controller.selectedIndex == 2)
                                Column(
                                  children: [
                                    Center(
                                      child: SfCartesianChart(
                                        title: ChartTitle(
                                            text: "تحليل المبيعات السنوي "),
                                        //  legend: Legend(isVisible: true),
                                        tooltipBehavior:
                                            controller.tooltipBehavior1,
                                        series: [
                                          LineSeries(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              name: "Sales",
                                              dataSource: controller.salesDat,
                                              xValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.Data,
                                              yValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.Total,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true,
                                                      color: Theme.of(context)
                                                          .primaryColorLight),
                                              enableTooltip: true),
                                        ],
                                        primaryXAxis: NumericAxis(
                                            edgeLabelPlacement:
                                                EdgeLabelPlacement.shift),
                                        primaryYAxis: NumericAxis(
                                            labelFormat: '{value}M',
                                            numberFormat:
                                                NumberFormat.simpleCurrency(
                                                    decimalDigits: 0)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.08,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: BoxTextField(
                                            controller: controller
                                                .fromexpiryDateController2,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2022-05-03'),
                                                lastDate: DateTime.parse(
                                                    '2025-05-03'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd()
                                                    .format(value!));
                                                controller
                                                    .fromexpiryDateController2
                                                    .text = DateFormat
                                                        .yMMMd()
                                                    .format(value);
                                              });
                                            },
                                            label: "From Date".tr,
                                            validator: (value) {
                                              //return controller.validateData(value!);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthApp * 0.04,
                                        ),
                                        Flexible(
                                          child: BoxTextField(
                                            controller: controller
                                                .toexpiryDateController2,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2022-05-03'),
                                                lastDate: DateTime.parse(
                                                    '2025-05-03'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd()
                                                    .format(value!));
                                                controller
                                                        .toexpiryDateController2
                                                        .text =
                                                    DateFormat.yMMMd()
                                                        .format(value);
                                              });
                                            },
                                            label: "To Date".tr,
                                            validator: (value) {
                                              //return controller.validateData(value!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    MainButton(text: "تحميل", press: () {})
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    Center(
                                      child: SfCartesianChart(
                                        title: ChartTitle(
                                            text: "تحليل المبيعات السنوي "),
                                        //  legend: Legend(backgroundColor: kwhite,isVisible: true),
                                        tooltipBehavior:
                                            controller.tooltipBehavior2,
                                        series: [
                                          ColumnSeries(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              name: "Sales",
                                              dataSource: controller.salesDat,
                                              xValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.Data,
                                              yValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.Total,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true,
                                                      color: Theme.of(context)
                                                          .primaryColorLight),
                                              enableTooltip: true),
                                        ],
                                        primaryXAxis: NumericAxis(
                                            edgeLabelPlacement:
                                                EdgeLabelPlacement.shift),
                                        primaryYAxis: NumericAxis(
                                            labelFormat: '{value}M',
                                            numberFormat:
                                                NumberFormat.simpleCurrency(
                                                    decimalDigits: 0)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.08,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: BoxTextField(
                                            controller: controller
                                                .fromexpiryDateController3,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2022-05-03'),
                                                lastDate: DateTime.parse(
                                                    '2025-05-03'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd()
                                                    .format(value!));
                                                controller
                                                    .fromexpiryDateController3
                                                    .text = DateFormat
                                                        .yMMMd()
                                                    .format(value);
                                              });
                                            },
                                            label: "From Date".tr,
                                            validator: (value) {
                                              //return controller.validateData(value!);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthApp * 0.04,
                                        ),
                                        Flexible(
                                          child: BoxTextField(
                                            controller: controller
                                                .toexpiryDateController3,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2022-05-03'),
                                                lastDate: DateTime.parse(
                                                    '2025-05-03'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd()
                                                    .format(value!));
                                                controller
                                                        .toexpiryDateController3
                                                        .text =
                                                    DateFormat.yMMMd()
                                                        .format(value);
                                              });
                                            },
                                            label: "To Date".tr,
                                            validator: (value) {
                                              //return controller.validateData(value!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    MainButton(text: "تحميل", press: () {})
                                    //   Center(
                                    //   child: SfCircularChart(
                                    //     title: ChartTitle(text: "تحليل المبيعات السنوي "),
                                    //     //             legend:
                                    //     // Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                                    //     // tooltipBehavior: controller.tooltipBehavior1,
                                    //     series: [
                                    //       PieSeries<GDPData, String>(
                                    //         dataSource: controller.chartData,
                                    //         xValueMapper: (GDPData data, _) => data.continent,
                                    //         yValueMapper: (GDPData data, _) => data.gdp,
                                    //         dataLabelSettings:
                                    //             DataLabelSettings( color:   Theme.of(context).primaryColorLight,isVisible: true),
                                    //         enableTooltip: true,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),    Center(
                                    //   child: SfCartesianChart(
                                    //     title: ChartTitle(text: "تحليل المبيعات السنوي "),
                                    //     //  legend: Legend(isVisible: true),
                                    //     tooltipBehavior: controller.tooltipBehavior1,
                                    //     series: [
                                    //       LineSeries(
                                    //         color: Theme.of(context).primaryColorDark ,
                                    //           name: "Sales",
                                    //           dataSource: controller.salesDat,
                                    //           xValueMapper: (SalesData sales, _) => sales.Data,
                                    //           yValueMapper: (SalesData sales, _) => sales.Total,
                                    //           dataLabelSettings: DataLabelSettings(
                                    //               isVisible: true,
                                    //               color: Theme.of(context).primaryColorLight),
                                    //           enableTooltip: true),
                                    //     ],
                                    //     primaryXAxis: NumericAxis(
                                    //         edgeLabelPlacement: EdgeLabelPlacement.shift),
                                    //     primaryYAxis: NumericAxis(
                                    //         labelFormat: '{value}M',
                                    //         numberFormat:
                                    //             NumberFormat.simpleCurrency(decimalDigits: 0)),
                                    //   ),
                                    // )
                                  ],
                                ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
