import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/delete_services.dart';
import 'package:fawry_app/app/data/Services/services.dart';
import 'package:fawry_app/app/modules/Add_Services/controllers/add_services_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ServicesController extends GetxController {
  var CategoriesListL = 0.obs;
  final companyId = Get.arguments[0];
  final itemtypeid = Get.arguments[1];
  var categoriesLis = [].obs;
  final count = 0.obs;
  final email = GetStorage().read('email');
  //TODO: Implement ServicesController
    // var controllerServices = Get.put(ServicesController());

var id;

  var isLoading = true.obs;
final token = GetStorage().read('Token');

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
 
    fetchMYServices();
    print("&&&&&&&&&&&&&&&&&&&&");
    print(email);
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

  void fetchMYServices() async {
    try {
        isLoading(true);     

      var vendors = await GetServices(itemtypeid,token);
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

   Future<void> RequestDeleteServices( id) async {
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
      final _res = await delete_Services(
       
        id.toString(),
        email.toString(),
        token,
      );    
     fetchMYServices();
Get.back();
     showSuccessSnackBar('The service has been successfully deleted'.tr);
      update();
   
         if (Get.isDialogOpen == true) Get.back();

   
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
           showErrorSnackBar('There is an error, please try again'.tr);

    }
  }
}
