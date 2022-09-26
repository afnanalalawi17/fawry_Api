import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/app/data/Model/units.dart';
import 'package:fawry_app/app/data/Services/add_services.dart';
import 'package:fawry_app/app/data/Services/units.dart';
import 'package:fawry_app/app/modules/Services/controllers/services_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../Shared/widget/ProgressIndicator.dart';

class AddServicesController extends GetxController {
  //TODO: Implement AddServicesController
  final companyID = Get.arguments[0];
  final itemtypeid = Get.arguments[1];
  final controllerServices = Get.put(ServicesController());
  RxBool on = false.obs; // our observable
  void toggle() => on.value = on.value ? false : true;
  var isLoading = true.obs;
  final email = GetStorage().read('email');
  final token = GetStorage().read('Token');
  var unitID;
  var unitEName;
  var unitAName;
  final GlobalKey<FormState> AddServices = GlobalKey<FormState>(); // Form
  late TextEditingController nameController,
      desController,
      unitController,
      sellingController,
      purchasingController,
      minimumController,
      existingController;
  var name = '';
  var selling = '';
  var unit = '';
  var purchasing = '';
  var minimum = '';
  var existing = '';
  var des = '';
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    unitController = TextEditingController();
    desController = TextEditingController();
    purchasingController = TextEditingController();
    minimumController = TextEditingController();
    existingController = TextEditingController();
    sellingController = TextEditingController();
    // print(activeid);
    fetchMYUnits();
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
      unitController.dispose();
      desController.dispose();
      sellingController.dispose();
      purchasingController.dispose();
      minimumController.dispose();
      existingController.dispose();
    } catch (e) {}
  }

  String? validate(String value) {
    if (value.isEmpty) {
      return "Please fill in the field".tr;
    }

    return null;
  }

  List<DataUnits> UnitsList = [];

  void fetchMYUnits() async {
    try {
      isLoading(true);
      var vendors = await GetUnits(token);
      UnitsList = vendors.data!;
      print("****************UnitsList****************");
      print(UnitsList);

      update();
    } finally {
      isLoading(false);
    }
  }

  BuildContext? context;
  void checkAddServices() {
    final isValid = AddServices.currentState!.validate();
    if (!isValid) {
      return;
    }
    RequestAddServices(context);
  }

  Future<void> RequestAddServices(context) async {
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
      final _res = await add_Services(
        nameController.text,
        nameController.text,
        companyID.toString(),
        itemtypeid.toString(),
        desController.text,
        sellingController.text,
        unitID.toString(),
        unitEName == 'Service' || unitAName == 'خدمة'
            ? purchasingController.text = '1'
            : 
            purchasingController.text,
        unitEName == 'Service' || unitAName == 'خدمة'
            ? existingController.text = '1000000'
            :
             existingController.text,
              unitEName == 'Service' || unitAName == 'خدمة'
            ? on.isFalse
      : 
       on.value,
        email.toString(),
        token,
      );
       controllerServices.fetchMYServices();
      Get.offAndToNamed(Routes.SERVICES,arguments: [companyID,itemtypeid]);
      showSuccessSnackBar("Added successfully".tr);
      update();
      GetStorage().write('itemID', _res.data![0].itemID);
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      Navigator.pop(context);
      showErrorSnackBar('There is an error, please try again'.tr);
    }
  }

  void increment() => count.value++;
}
