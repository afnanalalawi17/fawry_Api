import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/Services/get_Invoice%20_purchase.dart';
import 'package:fawry_app/app/data/services/get_Invoices_purchase_ByDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PurchaseInvoiceHistoryController extends GetxController {
  //TODO: Implement PurchaseInvoiceHistoryController
final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
final companyID =Get.arguments[0];
  var isLoading = true.obs;
  var categoriesLis = [].obs;
  var CategoriesListL = 0.obs;
  final count = 0.obs;
    var companyIDSearch;
  var supplierID;
  var itemID;
  var itemName;
  var companyEName;
  var companyAName;
  var id ;
      final GlobalKey<FormState> datalist = GlobalKey<FormState>(); 

     late TextEditingController searchController,fromexpiryDateController,toexpiryDateController;
List<dynamic> k = [];
  @override
  void onInit() {
    super.onInit();
        searchController= TextEditingController();
fromexpiryDateController = TextEditingController();
toexpiryDateController = TextEditingController();
fetchMYActivity();
print(k.length.toString());
k.add("value");
print(k.length.toString());
fetchInvoice(id);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
      searchController.dispose();
    fromexpiryDateController.dispose();
    toexpiryDateController.dispose();
  }
 String? validatedata(String value) {
      if (value.isEmpty) {
      return "Please enter the date".tr;

    }
    return null;
    }
  void increment() => count.value++;
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
  void fetchInvoice(id) async {
    try {   isLoading(true);
      var vendors = await invoice_purchase(companyIDSearch??companyID,token);
      categoriesLis.value = vendors.data!;
      print("%%%%%%%%%%%%%%%%%%%%%%%%");
      print(categoriesLis);
      print(CategoriesListL);

      update();
    } finally {
    isLoading(false);
    }
  }

    void fetchInvoicesPurchaseByDate() async {
    try {
      isLoading(true);
      var vendors = await InvoicesPurchaseByDate(
        companyIDSearch ?? companyID, token,
          fromexpiryDateController.text, toexpiryDateController.text);
      categoriesLis.value = vendors.data!;
      print("%%%%%%%%%%%%%%%%%%%%%%%%");
      print(categoriesLis);
      print(CategoriesListL);

      update();
    } finally {
      isLoading(false);
    }
  }
}
