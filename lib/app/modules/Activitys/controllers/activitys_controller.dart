import 'dart:async';
import 'dart:math';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/VideoPlayerFullscreen.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Services/Subscription.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/Services/get_ads.dart';
import 'package:fawry_app/app/data/Services/get_payment.dart';
import 'package:fawry_app/app/modules/Ads_app/views/ads_app_view.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:signalr_client/signalr_client.dart';
import 'package:video_player/video_player.dart';

import '../../../data/Services/services.dart';

class ActivitysController extends GetxController {
  //TODO: Implement ActivitysController
  var isLoading = true.obs;

  final confirmphone = GetStorage().read('mobileNoConfirmed');
  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
  var CompanyList = [].obs;
  var CategoriesListL = 0.obs;
  var SubscriptionList = [].obs;
  var CategoriesListL1 = 0.obs;
  final count = 0.obs;
  var companyID;

  bool isPaid = true;
  var id;
  int? check;
  Activity? activitiesModel;
  BuildContext? dialogContext;
  BuildContext? dialogContext1;
  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  Future loadList() async {
    keyRefresh.currentState?.show();
    await Future.delayed(Duration(milliseconds: 4000));
    fetchMYActivity();
    update();
  }
 var img;
  var timeOut = false.obs;
    late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 2;
   void onEnd() {
    timeOut(true);
    print('onEnd');
  }
  @override
  void onInit() async {
    super.onInit();

 
     controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  // categoriesLis[0].advertisementsID == 1
  //                 ? VideoPlayerFullscreenWidget(
  //                     controller: VideoPlayerController.asset(
  //                         'assets/images/voisess.mp4'))
  //                 : 
                  
  //                 CountdownTimer(
  //     endTime: endTime,
  //     onEnd: onEnd,
  //     widgetBuilder: (_, CurrentRemainingTime? time) {
  //       if (time == null) {
  //   Timer(
  //         Duration(seconds: 1),
  //         () => Get.toNamed(Routes.BASIC));
  //       }
                
  //                   return   Scaffold(
  //                     body:GestureDetector(
  //                       onTap: () {
  //                         print(timeOut.value);
  //                         print(endTime);
                      
  //                       },
  //                       child: Image.network(
  //                         "https://api.fawry-invoices.com/"
  //                         "${categoriesLis[0].adsImages[0].path}",
  //                         fit: BoxFit.fill,
  //                         height: double.infinity,
  //                         width: double.infinity,
  //                         alignment: Alignment.center,
  //                       ),
  //                     ),
  //                   );
  //                 }  );
           





    print(confirmphone);
    print(token);
    print("###############################");
    loadList();

    startConnection();
    initialisation();
    hubConnection.onclose((_) {
      print("Close connectrion");
    });
    hubConnection.on("ReceiveMessage", onReceiveMessage);
    print("*******GetCountries*********");

    print("*******GetCurrencies*********");
    //fetchMYCurrencies();
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
  void onClose() {}
  void increment() => count.value++;
  // var CompanyList = <DataCompany>[].obs;
  // var SubscriptionList = <Subscription>[].obs;

  fetchMYActivity() async {
    try {
      isLoading(true);

      var vendors = await GetActivity(email, token);

      CompanyList.value = vendors.data!;
      print("****************");
print(CompanyList.toString());
      update();
    } finally {
      isLoading(false);
    }
  }

  // void fetchMYServices(String id) async {
  //   try {
  //       isLoading(true);
  //     var vendors = await GetServices(id,token);
  //     categoriesLis1.value = vendors.data!;
  //     CategoriesListL1.value = vendors.data!.length;

  //     // print(categoriesLis);
  //     // print(CategoriesListL);

  //     update();
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  var url = "".obs;
  Future<String> fetchPayment() async {
    try {
      var items = await GetPayment(id, token);
      url.value = items.data!;

      print(url.value.toString());
      update();
      return items.data!;
    } finally {
      isLoading(false);
    }
  }


  var categoriesLis = [].obs;



  



  void fetchMYAds() async {
    try {
      isLoading(true);

      var vendors = await GetAds(token);
      categoriesLis.value = vendors.data!;
      print("https://api.fawry-invoices.com/"
          "${categoriesLis[0].adsImages[0].path}");
      img = "https://api.fawry-invoices.com/"
          "${categoriesLis[0].adsImages[0].path}";
      print('Vendors Here');

      print(categoriesLis);
    } finally {
      isLoading(false);
    }
  }
}


