import 'package:flutter/material.dart';
import 'package:get/get.dart';

double heightApp = Get.height;
double widthApp = Get.width;
extension ExtendedDouble on double {
  Widget get sizedHeight => SizedBox(
        height: this,
      );
  Widget get sizedWidget => SizedBox(
        width: this,
      );
}
// var apiKeyIOS = "AIzaSyAr-ioiBYm7S-IeB5yp6y3-glPL-LdlWzk";
const APIUrl = 'https://api.fawry-invoices.com/api/';