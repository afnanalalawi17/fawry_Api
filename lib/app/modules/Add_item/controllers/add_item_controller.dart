import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/ProgressIndicator.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Services/add_item.dart';
import 'package:fawry_app/app/modules/Items/controllers/items_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddItemController extends GetxController {
  //TODO: Implement AddItemController
final companyID= Get.arguments[0];
  final count = 0.obs;
   final email = GetStorage().read('email');
    final GlobalKey<FormState> AddItemFormKey = GlobalKey<FormState>();
  //TODO: Implement ServicesController
    var controllerItems = Get.put(ItemsController());
  late TextEditingController  nameController;
var id;
 var name = '';
  var isLoading = true.obs;
final token = GetStorage().read('Token');
  @override
  void onInit() {
    super.onInit();
      nameController = TextEditingController();
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
     
    } catch (e) {}
  }

  String? validate(String value) {
    if (value.isEmpty) {
      return "Please fill in the field".tr;
    }

    return null;
  }
  void increment() => count.value++;
BuildContext ?context;
   void checkAddItem() {
    final isValid = AddItemFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    RequestAddItem(context);
  }
   Future<void> RequestAddItem( context) async {
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
      final _res = await add_Item(
        nameController.text,
        nameController.text,
        companyID.toString(),
        email.toString(),
        token,
      );
     controllerItems.fetchMYItems();
      showSuccessSnackBar("Added successfully".tr);
      update();
      GetStorage().write('itemTypeID', _res.data![0].itemTypeID);
      Get.offAllNamed(Routes.ITEMS,
          arguments: [controllerItems.companyID]);
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      showErrorSnackBar('There is an error, please try again'.tr);
    }
  }
}
