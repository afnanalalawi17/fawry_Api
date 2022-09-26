import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackBar(String e) {
  Get.rawSnackbar(
    duration: Duration(seconds: 2),
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.red,
    borderRadius: 15,
    messageText: Text(
      e,
      textAlign: TextAlign.center,
      maxLines: 10,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.bounceInOut,
    barBlur: 50,
    snackPosition: SnackPosition.TOP,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
  );
}

void showSuccessSnackBar(String body) {
  Get.rawSnackbar(
    duration: Duration(seconds: 2),
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.TOP,
    borderRadius: 15,
    messageText: Text(
      body,
      textAlign: TextAlign.center,
      maxLines: 10,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeInOut,
    barBlur: 50,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
  );
}

 alertDialog( String body) {
  Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        scrollable: true,
        content: Column(
          children: [
            Text(
              body,
            ),
            20.0.sizedHeight,
          ],
        ),
      ),
      barrierDismissible: false,
    );
}
extension ExtendedDouble on double {
  Widget get sizedHeight => SizedBox(
        height: this,
      );
  Widget get sizedWidget => SizedBox(
        width: this,
      );
}
