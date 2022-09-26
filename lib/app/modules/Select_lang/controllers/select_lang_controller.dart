import 'package:fawry_app/main.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SelectLangController extends GetxController {
  //TODO: Implement SelectLangController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  //  checkStat();
    // print(onBoarding);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  //  checkStat() {
  //   if (onBoarding != 0) {
  //     GetStorage().write('loginStat', 'notLogin');
  //     print(onBoarding);
  //   }
  // }
}
