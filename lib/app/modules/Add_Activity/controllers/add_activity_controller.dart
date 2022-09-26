import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';

import 'package:fawry_app/app/data/Services/get_payment.dart';
import 'package:fawry_app/app/data/model/d.dart';
import 'package:fawry_app/app/data/services/countries.dart';
import 'package:fawry_app/app/modules/Activitys/controllers/activitys_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signalr_client/signalr_client.dart';

import '../../../data/Services/add_activity.dart';

class AddActivityController extends GetxController {
  //TODO: Implement AddActivityController
  final email = GetStorage().read('email');
  final phoneData = GetStorage().read('phone');
  final token = GetStorage().read('Token');
  var activityID = GetStorage().read('activityID');

  var isLoading = true.obs;
  RxBool toggle = false.obs;
  bool isSelected = false;
  var countryID;
  var currencyID;
  BuildContext? dialogContext;
var currencyAName;
var currencyEName;  
  var respcode = '';
  final GlobalKey<FormState> AddActivity = GlobalKey<FormState>(); // Form
  late TextEditingController nameController,
      phoneController,
      addressController,
      commercialController,
      numberController,
      expiryDateController,
      valueAddedTaxController,
    currencyController;
  bool  terms = false ;
  var name = '';
  var expiryDate = '';
  var phone = '';
  var address = '';
  var commercial = '';
  var number = '';
  var valueAddedTax = '';
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    expiryDateController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    commercialController = TextEditingController();
    numberController = TextEditingController();
    valueAddedTaxController = TextEditingController();
    currencyController = TextEditingController();
    print("&&&&&&&&&&&&&&&&");
    print(token.toString());
    fetchPayment();

    startConnection();
    initialisation();
    hubConnection.onclose((_) {
      print("Close connectrion");
    });
    hubConnection.on("ReceiveMessage", onReceiveMessage);
    print("*******GetCountries*********");

    fetchMYCounries();
    print("*******GetCurrencies*********");
    //fetchMYCurrencies();
  }

  void onReceiveMessage(List<dynamic> result) {
    dynamic data = result[0];
    print(result);
    print(data);
    if (data["message"].toString() == 'Success') {
      displayingNotification("تمت عملية الدفع بنجاح");
    } else {
      displayingNotification("خطا في عملية الدفع ");
    }

    Navigator.pop(dialogContext!);
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
                    //         ElevatedButton(
                    //           style: ElevatedButton.styleFrom(
                    //   primary: kblue,
                    //   shape:
                    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    // ),
                    //           onPressed: (){
                    //           Get.offAllNamed(Routes.BASIC);

                    //         }, child: ),
                    20.0.sizedHeight,
                  ],
                ),
              ),
              barrierDismissible: false,
            ));
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
  void dispose() {
    // attempt to dispose controller when Widget is disposed
    try {
      nameController.dispose();
      phoneController.dispose();
      addressController.dispose();
      commercialController.dispose();
      numberController.dispose();
      expiryDateController.dispose();
      valueAddedTaxController.dispose();
      currencyController.dispose();
    } catch (e) {}
  }

  // @override
  // void onClose() {
  //   phoneORemailController.dispose();
  //   passwordController.dispose();

  // }
  // List<DataCountries> CounriesList = [];
  var PeriodList = <DataCountries>[].obs;
  var PeriodList1 = <Currencies>[].obs;
  void fetchMYCounries() async {
    try {
      isLoading(true);
      var vendors = await GetCountries(token);
  vendors.data!.forEach((element) {
   PeriodList.add(element);
        element.currencies!.forEach((index1) {
          PeriodList1.add(index1);

          print(index1);
        });


});
      update();
    } finally{
    isLoading(false);
    }
  }

//   List<DataCurrencies> CurrenciesList = [];

//   void fetchMYCurrencies() async {
//     try { isLoading(true);
//       var vendors = await GetCurrencies(token);
//       CurrenciesList = vendors.data!;
//       print("****************CounriesList****************");
//       print(CounriesList);
//  toggle.value = true;
//       update();
//     } finally{
//     isLoading(false);
//     }
//   }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter the activity name".tr;
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please enter the address".tr;
    }
    return null;
  }

  void checkBoxCheck(bool value) {
    terms = value;
    update();
    //print(terms);
  }

  String? validateCommercial(String value) {
    if (value.isEmpty) {
      return "Please enter the commercial registration number".tr;
    } else if (value.length > 10) {
      return "Please enter a valid commercial registration number".tr;
    }
    return null;
  }

  String? validateData(String value) {
    if (value.isEmpty) {
      return "Please enter the tax registration expiry date".tr;
    }
    return null;
  }

  String? validateNumber(String value) {
    if (value.isEmpty) {
      return "Please enter the tax number".tr;
    } else if (value.length > 15) {
      return "Please enter a valid tax number".tr;
    }update();
    return null;
    
  }

  String? validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{9}$';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "Please enter the phone number".tr;
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid phone number".tr;
    }
    // else if ( value.length < 7){
    //                                                         return "الرجاء ادخال رقم هاتف صحيح";

    //                         }
    return null;
  }

  String? validate(String value) {
    if (value.isEmpty) {
      return "Please fill in the field".tr;
    }

    return null;
  }
  // void checkAddActivity() {
  //   final isValid = AddActivity.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   RequestAddActivity();
  // }

  // Future<void> RequestAddActivity() async {
  //   Get.dialog(
  //     AlertDialog(
  //       scrollable: true,
  //       content: Column(
  //         children: [
  //           Text(
  //             'الرجاء الانتظار',
  //           ),
  //           20.0.sizedHeight,
  //           Custom_ProgressIndicator()
  //         ],
  //       ),
  //     ),
  //     barrierDismissible: false,
  //   );
  //   try {
  //     final _res = await add_activity(
  //       nameController.text,
  //       addressController.text,
  //       numberController.text,
  //       commercialController.text,
  //       expiryDateController.text,
  //       phoneController.text,
  //       "".toString(),
  //       email.toString(),
  //       token,
  //     );
  //     Get.back();
  //     respcode = _res.code.toString();
  //     print(respcode);
  //     GetStorage().write('activityID', _res.data![0].activityID);
  //     print(activityID.toString());
  //   } catch (e) {
  //     if (Get.isDialogOpen == true) Get.back();
  //   }
  // }

  var url = "".obs;
  Future<String> fetchPayment() async {
    try {
      var items = await GetPayment(activityID, token);
      url.value = items.data!;

      update();
      return items.data!;
    } finally {
      isLoading(false);
    }
  }

  File? image;

  String? base64Image;
  final ImagePicker _picker = ImagePicker();

  Future getImage(var source) async {
    final pickedFile =
        await ImagePicker().getImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print('-------------------------');
      print(image);
      print(image.runtimeType);
      print('-------------------------');
      List<int> imageBytes = await pickedFile.readAsBytes();
      print('**************');
      print(imageBytes);
      print(imageBytes.runtimeType);
      print('**************');
      base64Image = base64Encode(imageBytes);
      print('-------------------------');
      print(base64Image);
      print(base64Image.runtimeType);
      print('-------------------------');
      update();
    } else {
      print('No image selected.');
    }
  }

  // File? image;
  // final ImagePicker _picker = ImagePicker();

  // String? base64Image;

  // Future pickImageFromGallery() async {

  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //     print('-------------------------');
  //     print(image);
  //     print(image.runtimeType);
  //     print('-------------------------');
  //     List<int> imageBytes = await pickedFile.readAsBytes();
  //     print('**************');
  //     print(imageBytes);
  //     print(imageBytes.runtimeType);
  //     print('**************');
  //     base64Image = base64Encode(imageBytes);
  //     print('-------------------------');
  //     print(base64Image);
  //     print(base64Image.runtimeType);
  //     print('-------------------------');
  //   } else {
  //     print('No image selected');
  //   }
  // }

}

class Country {
  String img;
  String text;
  Country(this.img, this.text);
}
