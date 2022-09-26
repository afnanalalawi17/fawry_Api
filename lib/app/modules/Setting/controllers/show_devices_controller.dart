
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/app/modules/Detials_Report/controllers/Item.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ShowDevicesController extends GetxController {
  //TODO: Implement ShowDevicesController

  final count = 0.obs;
bool isSelected = true;
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
    super.onClose();
  }

  void increment() => count.value++;
   
  var selectedIndex;
  onSelect(int index){
    selectedIndex= index;
    update();
  }
  _callNumber() async {
    const number = '0555578078'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

 
}
