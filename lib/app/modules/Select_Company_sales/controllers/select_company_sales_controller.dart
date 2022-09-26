import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Model/invoice_Model.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/Services/add_fav.dart';
import 'package:fawry_app/app/data/Services/get_Invoice.dart';
import 'package:fawry_app/app/data/Services/get_InvoicesByDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SelectCompanySalesController extends GetxController {
  //TODO: Implement SelectCompanySalesController
    var selectedCatIndex;
  onSelectCat(int index) {
    selectedCatIndex = index;
    update();
  }
  //TODO: Implement SalesInvoiceHistoryController
//TODO: Implement HistoryController
  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');

  var categoriesLis = [].obs;
  var CategoriesListL = 0.obs;
  var isLoading = true.obs;
  var categoriesLis1 = [].obs;
  var CategoriesListL1 = 0.obs;
  final count = 0.obs;
  var companyID;
  var supplierID;
  var itemID;
  var itemName;
  var companyEName;
  var companyAName;
  var list;
  var invoiceID;

  List<invoice_Model> ulist = [];
  List<invoice_Model> userLists = [];
  List<dynamic> favorite = [];
  late TextEditingController searchController,
      fromexpiryDateController,
      toexpiryDateController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    fromexpiryDateController = TextEditingController();
    toexpiryDateController = TextEditingController();
    fetchInvoice();
 
    fetchMYActivity();
    
    
    print("________________________________");

      

  }

  @override
  void onReady() {
    super.onReady();print("________________________________");


  }

  @override
  void onClose() {
    searchController.dispose();
    fromexpiryDateController.dispose();
    toexpiryDateController.dispose();
  }

  void increment() => count.value++;
  var InvoiceDetailsList = [].obs;

  void fetchInvoice() async {
    try {
      isLoading(true);
      var vendors = await Invoice(companyID, token);
      categoriesLis.value = vendors.data!;
      print("%%%%%%%%%%%%%%%%%%%%%%%%");
      print(categoriesLis);
      print(CategoriesListL);

      update();
    } finally {
      isLoading(false);
    }
  }

  void fetchInvoiceBydate() async {
    try {
      isLoading(true);
      var vendors = await InvoicesByDate(companyID, token,
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

  List<DataCompany> ActivityList = [];
  void fetchMYActivity() async {
    try {
      isLoading(true);
      var vendors = await GetActivity(email, token);

      categoriesLis.value= vendors.data!;
      ActivityList = vendors.data!;
      update();
    } finally {
      isLoading(false);
    }
  }

  Future<void> RequestAddFav(invoiceID) async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              'الرجاء الانتظار',
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      final _res = await AddFavorite(
        
        
        invoiceID,
         email.toString(),
         token);
      Get.back();
      showSuccessSnackBar('تم حذف الخدمة بنجاح');
      update();

      if (Get.isDialogOpen == true) Get.back();
    } catch (e) {
     
      if (Get.isDialogOpen == true) Get.back();
      showErrorSnackBar('هناك خطا ما الرجاء المحاولة مرة اخرى');
    }
  }
}
