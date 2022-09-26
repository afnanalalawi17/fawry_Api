import 'dart:async';

import 'package:fawry_app/Shared/widget/VideoPlayerFullscreen.dart';
import 'package:fawry_app/app/modules/Basic/views/basic_view.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/ads_app_controller.dart';

class AdsAppView extends GetView<AdsAppController> {
  @override
  Widget build(BuildContext context) {
    // final isMuted = controller.Videocontroller.value.volume == 0;
    return GetBuilder<AdsAppController>(
        init: AdsAppController(),
        initState: (_) {},
        builder: (_) {
          return  controller.isLoading.value != true
              ? controller.categoriesLis[0].advertisementsID == 1
                  ? VideoPlayerFullscreenWidget(
                      controller: VideoPlayerController.asset(
                          'assets/images/voisess.mp4'))
                  : 
                  
                  CountdownTimer(
      endTime: controller.endTime,
      onEnd: controller.onEnd,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
    Timer(
          Duration(seconds: 1),
          () => Get.toNamed(Routes.BASIC));
        }
                
                    return   Scaffold(
                      body:GestureDetector(
                        onTap: () {
                          print(controller.timeOut.value);
                          print(controller.endTime);
                      
                        },
                        child: Image.network(
                          "https://api.fawry-invoices.com/"
                          "${controller.categoriesLis[0].adsImages[0].path}",
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  }  )
              : Scaffold(
                  body: Image.asset(
                    "assets/images/Background.png",
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                );
        });
  }
}
