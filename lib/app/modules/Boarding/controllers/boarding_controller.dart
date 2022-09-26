import 'package:fawry_app/app/modules/Boarding/views/on_boarding_model.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  //TODO: Implement BoardingController
var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value ==  screens.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
     Get.toNamed(Routes.HOME);
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }
  List<OnBoardingModel> screens = <OnBoardingModel>[
    OnBoardingModel(
      img: 'assets/images/on_boarding_1.png',
      text: "All kinds of invoices".tr,
    ),
    OnBoardingModel(
      img: 'assets/images/on_boarding_2.png',
      text: "Easily complete all your invoices".tr,
    ),
  ];


}
