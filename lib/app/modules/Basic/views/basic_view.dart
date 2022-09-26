import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/app/modules/Activitys/views/activitys_view.dart';
import 'package:fawry_app/app/modules/Profile/views/profile_view.dart';
import 'package:fawry_app/app/modules/multi_history/views/multi_history_view.dart';
import 'package:fawry_app/app/modules/Setting/views/show_devices_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/basic_controller.dart';

class BasicView extends GetView<BasicController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasicController>(
      builder: (controller) {
        return WillPopScope(
    onWillPop: () async => false,
          child: Scaffold(      
             backgroundColor: Color(0xffE5E5E5),

            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                ActivitysView(),
                MultiHistoryView(),
                ShowDevicesView(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12), topLeft: Radius.circular(12)),
    
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
      child: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              unselectedItemColor: kgreyPrimery,
                    backgroundColor: kwhite,

              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              iconSize: 18,
              elevation: 20,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                 BottomNavigationBarItem(
                  label: 'Activities'.tr,
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/images/bnb1.png',
                      color: controller.tabIndex == 0 
                          ? Theme.of(context).primaryColor
                          : kgreyPrimery
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Invoices'.tr,
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/images/bnb3.png',
                     color: controller.tabIndex == 1 
                          ? Theme.of(context).primaryColor
                          : kgreyPrimery
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'More'.tr,
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/images/bnb2.png',
                      color: controller.tabIndex ==2 
                          ? Theme.of(context).primaryColor
                          : kgreyPrimery
                    ),
                  ),
                ),
              ],
            ),
          )
          )),
        );
      },
    );
  }
}
