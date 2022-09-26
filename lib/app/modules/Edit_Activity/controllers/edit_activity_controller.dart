import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditActivityController extends GetxController {
  //TODO: Implement EditActivityController
//  final compayId = Get.arguments[0];
  final count = 0.obs;
    final GlobalKey<FormState> EditActivity = GlobalKey<FormState>(); // Form
 late TextEditingController nameController,
      phoneController,
      addressController,
      dataController;
     
  var name = '';
  var phone = '';
  var address = '';
  var data = '';

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    dataController = TextEditingController();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dataController.dispose();
  }

  void increment() => count.value++;
  File? image;

  String? base64Image;
  final ImagePicker _picker = ImagePicker();

  Future getImage(var source) async {
    final pickedFile =
        await ImagePicker().getImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print('-------------------------');
      print(image);
      print(image.runtimeType);
      print('-------------------------');
      List<int> imageBytes = await pickedFile.readAsBytes();
      print('**************');
      print(imageBytes);
      print(imageBytes.runtimeType);
      print('**************');
      base64Image = base64Encode(imageBytes);
      print('-------------------------');
      print(base64Image);
      print(base64Image.runtimeType);
      print('-------------------------');
      update();
    } else {
      print('No image selected.');
    }
  }
}
