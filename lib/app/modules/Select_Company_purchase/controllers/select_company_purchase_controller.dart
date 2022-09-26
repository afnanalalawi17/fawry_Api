import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/Services/get_Invoice _purchase.dart';

class SelectCompanyPurchaseController extends GetxController {
  //TODO: Implement SelectCompanyPurchaseController
   var selectedCatIndex;
  onSelectCat(int index) {
    selectedCatIndex = index;
    update();
  }
  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');

  var isLoading = true.obs;
  var categoriesLis = [].obs;
  var CategoriesListL = 0.obs;
  final count = 0.obs;
    var companyID;
  var supplierID;
  var itemID;
  var itemName;
  var companyEName;
  var companyAName;
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

  void increment() => count.value++;
   List<DataCompany> ActivityList = [];
  void fetchMYActivity() async {
    try {
      isLoading(true);
      var vendors = await GetActivity(email, token);
      categoriesLis.value = vendors.data!;
      ActivityList = vendors.data!;
      update();
    } finally {
      isLoading(false);
    }
  }
  // void fetchInvoice() async {
  //   try {   isLoading(true);
  //     var vendors = await invoice_purchase(companyID,token);
  //     categoriesLis.value = vendors.data!;
  //     print("%%%%%%%%%%%%%%%%%%%%%%%%");
  //     print(categoriesLis);
  //     print(CategoriesListL);

  //     update();
  //   } finally {
  //   isLoading(false);
  //   }
  // }
}
