import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Model/Circular_Chart_Model.dart';
import 'package:fawry_app/app/data/Services/Circular_Chart.dart';
import 'package:fawry_app/app/data/Services/Column_Chart.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/model/Column_Chart_Model.dart';
import 'package:fawry_app/app/modules/Detials_Report/controllers/Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetialsReportController extends GetxController {
  //TODO: Implement DetialsReportController
    var isLoading = true.obs;
     var companyID;
     var companyNameAR;
      var companyNameEN;
        var CircularList = [].obs;

 final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
  late List<SalesData> salesDat;
  late TooltipBehavior tooltipBehavior1;
  late TextEditingController fromexpiryDateController,
      toexpiryDateController,
      fromexpiryDateController2,
      toexpiryDateController2,
      fromexpiryDateController3,
      toexpiryDateController3;

  // late List<GDPData> chartData;
     List<DataCircular> circularData = [];
     List<DataColumnChart> columnData = [];

  late TooltipBehavior tooltipBehavior2;
  var fromexpiryDate = '';
  var toexpiryDate = '';
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print(companyID);
    print(token);
    salesDat = getSalesData();
    // chartData = getChartData();
    fetchMYCircularChart();
    tooltipBehavior1 = TooltipBehavior(enable: true);
    tooltipBehavior2 = TooltipBehavior(enable: true);
    fromexpiryDateController = TextEditingController();
    toexpiryDateController = TextEditingController();
    fromexpiryDateController2 = TextEditingController();
    toexpiryDateController2 = TextEditingController();
    fromexpiryDateController3 = TextEditingController();
    toexpiryDateController3 = TextEditingController();
    fetchMYActivity();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    fromexpiryDateController.dispose();
    toexpiryDateController.dispose();
    fromexpiryDateController2.dispose();
    toexpiryDateController2.dispose();
    fromexpiryDateController3.dispose();
    toexpiryDateController3.dispose();
  }

  void increment() => count.value++;
  List<Item> apa = [
    // Item(Icons.apps),
    Item(Icons.bar_chart_rounded),
    Item(Icons.pie_chart_outline_rounded),
    Item(Icons.area_chart_rounded),
  ];

  List<SalesData> getSalesData() {
    final List<SalesData> DataSales = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30),
    ];
    return DataSales;
  }

  // List<GDPData> getChartData() {
  //   final List<GDPData> chartData = [
  //     GDPData('Oceania', 1600),
  //     GDPData('Africa', 2490),
  //     GDPData('S America', 2900),
  //     GDPData('Europe', 23050),
  //     GDPData('N America', 24880),
  //     GDPData('Asia', 34390),
  //   ];
  //   return chartData;
  // }

  var selectedIndex;
  onSelect(int index) {
    selectedIndex = index;
    update();
  } List<DataCompany> ActivityList = [];
  void fetchMYActivity() async {
    try {
      isLoading(true);
      var vendors = await GetActivity(email, token);
     ActivityList = vendors.data!;
      update();
    } finally {
      isLoading(false);
    }
  }


  fetchMYCircularChart() async {
    try {
      isLoading(true);

      var vendors = await GetCircularChart(companyID, token);
print("************fetchMYCircularChart*************");
      circularData = vendors.data!;

      update();
    } finally {
      isLoading(false);
    }
  }
    fetchMYColumnChart() async {
    try {
      isLoading(true);

      var vendors = await GetColumnChart(companyID, token);
print("*************************");
      columnData = vendors.data!;

      update();
    } finally {
      isLoading(false);
    }
  }
}
