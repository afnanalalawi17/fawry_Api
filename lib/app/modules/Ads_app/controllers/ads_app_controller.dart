import 'dart:async';

import 'package:fawry_app/app/data/Services/get_ads.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class AdsAppController extends GetxController {
  //TODO: Implement AdsAppController

  final count = 0.obs;
  var categoriesLis = [].obs;

  final email = GetStorage().read('email');

  var isLoading = true.obs;
  final token = GetStorage().read('Token');
  // late VideoPlayerController Videocontroller;
  final assets = 'assets/images/voisess.mp4';
  var img;
  var timeOut = false.obs;
    late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 2;
   void onEnd() {
    timeOut(true);
    print('onEnd');
  }
  @override
  void onInit() {
    super.onInit();
    fetchMYAds();
        controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
print(DateTime.now().millisecondsSinceEpoch + 1000 * 10);
    // Videocontroller = VideoPlayerController.asset(assets)
    //   ..addListener(() {
    //     update();
    //     // Implement your calls inside these conditions' bodies :
    //     if (Videocontroller.value.position ==
    //         const Duration(seconds: 0, minutes: 0, hours: 0)) {
    //       print('video Started');
    //     }

    //     if (Videocontroller.value.position == Videocontroller.value.duration) {
    //       print('video Ended');

    //       Get.offAllNamed(Routes.BASIC);
    //     }
    //     update();
    //   })
    //   ..setLooping(false)
    //   ..initialize().then((_) => Videocontroller.play());

// if (categoriesLis[0].advertisementsID == 2){
//    Timer(
//           Duration(seconds: 1),
//           () => print('image Ended'));
// }



    update();
  }

  @override
  void onReady() {
    super.onReady();
    print(endTime.toString());
  }

  @override
  void onClose() {
    super.onClose();
    // Videocontroller.dispose();
  }

  void increment() => count.value++;

  void fetchMYAds() async {
    try {
      isLoading(true);

      var vendors = await GetAds(token);
      categoriesLis.value = vendors.data!;
      print("https://api.fawry-invoices.com/"
          "${categoriesLis[0].adsImages[0].path}");
      img = "https://api.fawry-invoices.com/"
          "${categoriesLis[0].adsImages[0].path}";
      print('Vendors Here');

      print(categoriesLis);
    } finally {
      isLoading(false);
    }
  }
}
