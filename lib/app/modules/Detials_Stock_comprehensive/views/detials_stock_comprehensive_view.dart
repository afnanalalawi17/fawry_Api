import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detials_stock_comprehensive_controller.dart';

class DetialsStockComprehensiveView
    extends GetView<DetialsStockComprehensiveController> {
   final lang = Get.put(AppLanguageController());
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
         centerTitle: true,

        title:Text(
              'Stock'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            leading:BackButton( color: Theme.of(context).primaryColorDark,onPressed: (){
                  Navigator.of(context).pop(); 
            },)
      ),
      body: 
         GetBuilder<DetialsStockComprehensiveController>(
          init: DetialsStockComprehensiveController(),
          initState: (_) {},
          builder: (_) {
            return 
      
      
      SingleChildScrollView(
        child: Form(
          child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                
                
                 Obx(() => controller.isLoading.value == false
                            ? controller.ActivityList.isEmpty
                                ? Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Color(0xffE22D2D)
                                              .withOpacity(.40),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.warning_amber_rounded,
                                              color: Colors.red,
                                              size: 28,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "${"Please add your company to be able to view your activity reports".tr}"
                                                  .tr,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblack),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightApp * 0.02,
                                      ),
                                    ],
                                  )
                                : controller.companyID == null
                                    ? Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Color(0xffE22D2D)
                                                  .withOpacity(.40),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: Colors.red,
                                                  size: 28,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Please select a company to show report'
                                                      .tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: heightApp * 0.02,
                                          ),
                                        ],
                                      )
                                    :Container()
                            : Container()),
              Container(
                              // height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: kwhite,
                                //border: Border.all(color: kblue, width: 2)
                              ),
                              child: DropdownButtonFormField(
                                //  value: controller.ActivityList[0],
                                iconEnabledColor: Theme.of(context).primaryColor,
                                iconDisabledColor: Theme.of(context).primaryColor,
                                style: TextStyle(color: kblack),
                                dropdownColor: kwhite,

                                //  key: controller.ADDdropFormKey,
                                validator: (value) {
                                  print(value.runtimeType);
                                  if (value == null) {
                                    return 'Please select a Company'.tr;
                                  }

                                  return null;
                                },
                                isDense: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,

                                decoration: InputDecoration(
                                  hintText: 'Company selection'.tr,
                                  hintStyle: TextStyle(
                                      color: kblack,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                items: lang.appLocale == 'en'
                                    ? controller.ActivityList.map((value) {
                                        return DropdownMenuItem<int>(
                                          value: value.companyID,
                                          child: Text(value.companyEName!),
                                          onTap: () {
                                            controller.companyID =
                                                value.companyID;
                                            print(value.companyEName.toString());
                                            controller.update();
                                            
                                          },
                                        );
                                      }).toList()
                                    : controller.ActivityList.map((value) {
                                        return DropdownMenuItem<int>(
                                          value: value.companyID,
                                          child: Text(value.companyAName!),
                                          onTap: () {
                                            controller.companyID =
                                                value.companyID;
                                            controller.update();
                                           
                                          },
                                        );
                                      }).toList(),
                                onChanged: (newValue) {},

                                isExpanded: true,
                              ),
                            ),

                            SizedBox(
                              height: heightApp * 0.02,
                            ),          

                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: MainButton(text: "Download", press: (){}),
                          )
              ],
            ),
          ),
        ),
      );
   }) );
  }
}
