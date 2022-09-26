// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Model/AddServices_Model.dart';
import 'package:fawry_app/app/data/Model/Items_Model.dart';
import 'package:fawry_app/app/data/Model/Supplier_Model.dart';
import 'package:fawry_app/app/data/Services/RegisterSupplier.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/Services/get_Items.dart';
import 'package:fawry_app/app/data/Services/invoice_purchase.dart';
import 'package:fawry_app/app/data/Services/services.dart';
import 'package:fawry_app/app/data/Services/supplier.dart';
import 'package:fawry_app/app/modules/History2/views/history2_view.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:signalr_client/signalr_client.dart';

class History2Controller extends GetxController {
  //TODO: Implement History2Controller
  var isLoading = true.obs;
var url;
var isActive = true;
BuildContext ?dialogContext;
  var count;
  var addres;
  var taxNumber;
  var taxValue;
  var commercialRecordNo;
  var registerDate;
  var phoneInvoice;
  var invoiceId;
   late num tax;
  num? total;
  var totallist;
  var id;
  late num totalWithTax;
  var companyID;
  var supplierID;
  var itemID;
  var itemName;
  var companyEName;
  var companyAName;
  var supplierEName;
  var supplierAName;
  var itemEName;
  var itemAName;
  var itemTypeID;
  var itemTypeName;
    var itemTypeEName;
  var itemTypeAName;
  var discounttext;
  var Price;
  var itemPurchase;
  var categoriesLis = [].obs;
  var CategoriesListL = 0.obs;
    bool ?ishasTax;
    bool ?itemishastax;
    num  totalproduct = 0.0;
    num totalwithtaxproduct=0.0;
    num totalwithtaxproductPdf=0.0;
    num totaldicount = 0.0;
      List ListProduct = [];
            List ListFinal = [];
  BuildContext? dialogContext1;
  final viewc = Get.put(History2View());
 var statusCode ="";
  late TextEditingController nameController,
      addressController,
      phoneController,
      numberController,
      countController,
      totalController,
      totalWithTaxController,
      unitController,
      discountController,
      sellingController,
      totaldiscountController;
  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
  RxBool on = false.obs; // our observable
  void toggle() => on.value = on.value ? false : true;
  final GlobalKey<FormState> ADDitemFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> ADDitemFormKey2 = GlobalKey<FormState>();
     final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();

  reset() {
    key.currentState!.reset();
  }

  var name = '';
  var address = '';
  var phone = '';
  var number = '';

  var unit;
  var discount;

  var selling;
  var res;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    numberController = TextEditingController();
    countController = TextEditingController();
    totalController = TextEditingController();
    totalWithTaxController = TextEditingController();
    discountController = TextEditingController();
    unitController = TextEditingController();
    sellingController = TextEditingController();
    totaldiscountController = TextEditingController();

    fetchMYActivity();
    print("%%%%%%%%%%%%%%%%%%%%%%%");
    fetchMYSupplier(id);
     startConnection();
    initialisation();
    hubConnection.onclose((_) {
      print("Close connectrion");
    });
    hubConnection.on("ReceiveMessage", onReceiveMessage);
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
    fetchMYActivity();
    print("%%%%%%%%%%%%%%%%%%%%%%%");
    fetchMYSupplier(id);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    numberController.dispose();
    countController.dispose();
    totalController.dispose();
    totalWithTaxController.dispose();
    discountController.dispose();
    unitController.dispose();
    sellingController.dispose();
    totaldiscountController.dispose();
  }
 String? validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{9}$';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "Please enter the phone number".tr;
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid phone number".tr;
    }
  
    return null;
  }
   String? validateNumber(String value) {
    if (value.isEmpty) {
      return "Please enter the tax number".tr;
    } else if (value.length > 15) {
      return "Please enter a valid tax number".tr;
    }
    return null;
  }
  String? validate(String value) {
    if (value.isEmpty) {
      return "Please fill in the field".tr;
    }

    return null;
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

  List<DataSupplier> SupplierList = [];
  void fetchMYSupplier(id) async {
    try {
      isLoading(true);
      var vendors = await GetSupplier(companyID, token);
      SupplierList = vendors.data!;
      print(SupplierList);
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
  void fetchMYServices() async {
    try {
      isLoading(true);
      var vendors = await GetServices(itemTypeID, token);
      ServicesList = vendors.data!;

      update();
    } finally {
      isLoading(false);
    }
  }

  Future<void> RequestRegisterSupplier() async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,
              style: TextStyle(color: kblack),
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      res = await RegisterSupplier(
          companyID,
          email.toString(),
          nameController.text,
          nameController.text,
          phoneController.text,
          addressController.text,
          numberController.text,
          token);
      if (Get.isDialogOpen == true) Get.back();
      showSuccessSnackBar('Added successfully'.tr);
      print("*******************");

      nameController.text = '';
      addressController.text = '';
      phoneController.text = '';
      numberController.text = '';
    } catch (e) {
  if (Get.isDialogOpen == true) Get.back();
      showErrorSnackBar('There is an error, please try again'.tr);
    }

    update();
  }

  void checkAddInvoicePurchase() {
    final isValid = ADDitemFormKey2.currentState!.validate();
    if (!isValid) {
      return;
    }

    RequestAddInvoicePurchase();
  }

  Future<void> RequestAddInvoicePurchase() async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              'please wait...'.tr,
              style: TextStyle(color: kblack),
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
//     print("^^^^^^^^^^^^^^^");
// print(totalproduct);
// print(totalwithtaxproduct);
// print("^^^^^^^^^^^^^^^");
    try {
      final _res = await add_invoice_purchase(
        // itemID,
        supplierID,
        companyID,
        totaldicount.toString(), email.toString(),
        // selling.toString(),
        // unit.toString(),
        // count.toString(),
        
        totalproduct,


          totalwithtaxproduct ,
        
       

        token,
ListFinal
      );

         statusCode = 'true';
    print(statusCode);
      if (Get.isDialogOpen == true) Get.back();
      showSuccessSnackBar("Your invoice has been issued successfully".tr);
     

      update();
      
 
    } catch (e) {
      statusCode = 'false';
        print(statusCode);

      if (Get.isDialogOpen == true) Get.back();
      showErrorSnackBar('There is an error, please try again'.tr);
    }
  }
}
