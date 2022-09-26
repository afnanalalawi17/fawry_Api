import 'dart:ui';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/modules/Boarding/views/on_boarding_model.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/boarding_controller.dart';

class BoardingView extends GetView<BoardingController> {
  @override
  final controller = Get.put(BoardingController());
  final _controller = BoardingController();

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Color(0xFF191970),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Image(image: AssetImage('assets/images/light.png')),
                    Expanded(
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _controller.pageController,
                          onPageChanged: _controller.selectedPageIndex,
                          itemCount: _controller.screens.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  screens[index].img,
                                ),
                                SizedBox(
                                  height: heightApp * 0.03,
                                ),
                                Text(screens[index].text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: kwhite,
                                    )),
                              ],
                            );
                          }),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                          height: heightApp * 0.055,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kwhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              Get.offAllNamed(Routes.SIGNUP);
                            },
                            child: Center(
                              child: Text(
                                "start now".tr,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: kblue,
                                ),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: heightApp * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _controller.screens.length,
                        (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color:
                                  _controller.selectedPageIndex.value == index
                                      ? kwhite
                                      : kwhite.withOpacity(.4),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: heightApp * 0.15,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/vector_top_right.png"),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset("assets/images/vector_bottom_left.png"),
              ),
            ],
          )),
    );
  }
}
