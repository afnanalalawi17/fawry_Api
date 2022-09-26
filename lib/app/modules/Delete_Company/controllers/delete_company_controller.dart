import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/activity.dart';
import 'package:fawry_app/app/data/Services/delete_company.dart';
import 'package:fawry_app/app/modules/Activitys/bindings/activitys_binding.dart';
import 'package:fawry_app/app/modules/Activitys/controllers/activitys_controller.dart';
import 'package:fawry_app/app/modules/Activitys/views/activitys_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DeleteCompanyController extends GetxController {
  //TODO: Implement DeleteCompanyController
 var CategoriesListL = 0.obs;
  var categoriesLis = [].obs;
  final count = 0.obs;
  final email = GetStorage().read('email');
  //TODO: Implement ServicesController
     var controllerActivity = Get.put(ActivitysController());

var id;

  var isLoading = true.obs;
final token = GetStorage().read('Token');

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
 
    fetchMYActivity();
    print("&&&&&&&&&&&&&&&&&&&&");
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

  void fetchMYActivity() async {
    try {
        isLoading(true);     

      var vendors = await GetActivity(email,token);
      categoriesLis.value = vendors.data!;
      CategoriesListL.value = vendors.data!.length;

      print('Vendors Here');

      print(categoriesLis);
      print(CategoriesListL);
         
      update();
     } finally {
      isLoading(false);
    }
  }

   Future<void> RequestDeleteCompany( id) async {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
             'please wait...'.tr,
            ),
            20.0.sizedHeight,
            Custom_ProgressIndicator()
          ],
        ),
      ),
      barrierDismissible: false,
    );
    try {
      final _res = await Delete_Company(
       
        id.toString(),
        email.toString(),
        token,
      );    
      controllerActivity.fetchMYActivity();
     fetchMYActivity();
Get.back();
     showSuccessSnackBar('The activity has been successfully deleted'.tr);
      update();
   
         if (Get.isDialogOpen == true) Get.back();

   
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
  showErrorSnackBar('There is an error, please try again'.tr);
    }
  }
}
