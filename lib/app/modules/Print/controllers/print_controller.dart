import 'dart:async';

import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Model/AddServices_Model.dart';
import 'package:fawry_app/app/data/Model/Items_Model.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/Services/get_Items.dart';
import 'package:fawry_app/app/data/Services/services.dart';
import 'package:fawry_app/app/modules/Print/views/print_view.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:signalr_client/signalr_client.dart';

class PrintController extends GetxController {
  //TODO: Implement PrintController
    final GlobalKey<FormState> ADDitemFormKey = GlobalKey<FormState>(); 
     final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final email = GetStorage().read('email');
final token = GetStorage().read('Token');var url;
var isActive = true;
BuildContext ?dialogContext;
  BuildContext? dialogContext1;

 var companyID;
var itemEName;
var itemAName;
var ishastax;
 var itemTypeID;
  var itemTypeName;
    var itemTypeEName;
  var itemTypeAName;
   late num tax;
var Price;
  var isLoading = true.obs;

  var categoriesLis = [].obs;
  var CategoriesListL = 0.obs;

  late TextEditingController countController,  priceController ,textemptyController, price,

      
   
      totalController,
      totalWithTaxController;
 var count = '';

  var total = '';
  var totalWithTax = '';
  @override
  void onInit() {
    super.onInit();
       print("*********************");

   print(Price);
    // fetchMYServices(id);
    // textemptyController = TextEditingController(text: "00.0");
    countController= TextEditingController();
   priceController =TextEditingController();
    totalController = TextEditingController();
    totalWithTaxController = TextEditingController();
    fetchMYActivity();
     startConnection();
    initialisation();
    hubConnection.onclose((_) {
      print("Close connectrion");
    });    hubConnection.on("ReceiveMessage", onReceiveMessage);

  }
 void onReceiveMessage(List<dynamic> result) async {
    dynamic data = result[0];
    print(result);
    print(data);
    if (data["message"].toString() == 'Success') {
      displayingNotification("تمت عملية الدفع بنجاح");
      // final _res = await StartSubscription(companyID,2 ,token);
       fetchMYActivity();
              Navigator.of(dialogContext1!).pop();
    
      Timer(
          Duration(seconds: 1),
          () => Get.dialog(
                AlertDialog(
                  scrollable: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  content: Column(
                    children: [
                      20.0.sizedHeight,
                      Image.asset('assets/images/success.png'),
                      const SizedBox(height: 40),
                      Text(
                        'Congrats!'.tr,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Subscription paid successfully'.tr,
                      ),
                      const SizedBox(height: 10),
                      MainButton(
                        text: "موافق",
                        press: () {
                          Get.offAllNamed(Routes.BASIC);
                        },
                      ),
                      20.0.sizedHeight,
                    ],
                  ),
                ),
                barrierDismissible: false,
              ));
             
    } else {
      displayingNotification("خطا في عملية الدفع ");
      Navigator.pop(dialogContext1!);
      Timer(Duration(seconds: 1), () {
        print("object");
      });
    }
  }

  final hubConnection = HubConnectionBuilder()
      .withUrl(
          "https://api.fawry-invoices.com/NotificationHub?Email=${GetStorage().read('email')}")
      .build();
  void startConnection() async {
    print("*************Connection**************");
    await hubConnection.start(); // Inicia a conexão ao servidor
  }

  var fP = FlutterLocalNotificationsPlugin();

  Future<void> initialisation() async {
    var androidSetup = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetup = IOSInitializationSettings();
    final setupNotification =
        InitializationSettings(android: androidSetup, iOS: iosSetup);
    await fP.initialize(
      setupNotification,
      // onSelectNotification: selectNotification
    );
  }

  // Future<void> selectNotification(String payload) {
  //   if (payload != null) {
  //     print(payload);
  //   }
  // }

  Future<void> displayingNotification(String body) async {
    var androidDetail = AndroidNotificationDetails(
      "id",
      "name",
      // "description",
      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,
    );
    var iosDetail = IOSNotificationDetails();
    final allDetail =
        NotificationDetails(android: androidDetail, iOS: iosDetail);
    await fP.show(0, "فوري", body, allDetail, payload: "first notifications");
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textemptyController.dispose();
       countController.dispose();
priceController.dispose();
    totalController.dispose();
    totalWithTaxController.dispose();
  
  }String? validate1(String value) {
      if (value.isEmpty) {
      return "Please select a service".tr;
    }}
String? validate(String value) {
      if (value.isEmpty) {
      return "Please enter the quantity".tr;
    }else if (int.parse(value)  < 1){
        return "Please enter the quantity".tr;
    }
    
    }
     List<DataCompany> ActivityList = [];
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
  List<DataItems> ItemsList = [];
  void fetchMYItems() async {
    try {
      isLoading(true);
      var vendors = await GetItems(companyID, token);
      ItemsList = vendors.data!;
      update();
    } finally {
      isLoading(false);
    }
  }
    List<DataServices> ServicesList = [];
  void fetchMYServices( ) async {
    try {
      isLoading(true);
      var vendors = await GetServices(itemTypeID, token);
      ServicesList = vendors.data!;

      update();
    } finally {
      isLoading(false);
    }
  }
}
