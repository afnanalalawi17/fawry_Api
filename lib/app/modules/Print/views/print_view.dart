import 'dart:async';

import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/Dismiss_Keyboard.dart';
import 'package:fawry_app/Shared/widget/Dropdown.dart';
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/box_Text_Field.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/Shared/widget/grey_Text_Field.dart';
import 'package:fawry_app/Shared/widget/main_button.dart';
import 'package:fawry_app/app/data/Model/Add_invoice_Model.dart';
import 'package:fawry_app/app/data/Services/add_Invoice.dart';
import 'package:fawry_app/app/data/Services/get_payment.dart';
import 'package:fawry_app/app/lang/lang_controller.dart';
import 'package:fawry_app/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../Shared/widget/ProgressIndicator.dart';
import '../controllers/print_controller.dart';

class PrintView extends GetView<PrintController> {
  List Listdata = [];

  @override
  final controller = Get.put(PrintController());
  final lang = Get.put(AppLanguageController());

  var datalist;
  num? total;
  late num totalWithTax;
  late String itemName;
  // var Price;
  var Name;
  var ID;
  var Count;
  num totalAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  "sales invoices".tr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                leading: BackButton(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    controller.Price = null;
                     controller.priceController.clear();
                    Get.offAndToNamed(Routes.BASIC);
                  },
                )),
            body: GetBuilder<PrintController>(
                init: PrintController(),
                initState: (_) {},
                builder: (_) {
                  return SingleChildScrollView(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Form(
                      key: controller.ADDitemFormKey,
                      child: Column(
                        children: [
                          Listdata.isEmpty
                              ? Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffE22D2D).withOpacity(.40),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: Colors.red,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                          child: Text(
                                        'Please add a product for the print button to appear'
                                            .tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      )),
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: heightApp * 0.01,
                                ),
                          SizedBox(
                            height: heightApp * 0.01,
                          ),
                          Dropdown(
                         onChanged: (p0) {
                         
                           controller.key.currentState!.reset();
                                                          controller.key1.currentState!.reset();

                         },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a Company'.tr;
                              }

                              return null;
                            },
                            items: lang.appLocale == 'en'
                                ? controller.ActivityList.map((value) {
                                    return DropdownMenuItem<int>(
                                      value: value.companyID,
                                      child: Text(value.companyEName!),
                                      onTap: () {
                                        // ignore: unnecessary_null_comparison
                                    controller.isActive= value.subscription![0].isActive!;




                         controller.isActive == false
                                                           ? Get.rawSnackbar(
    duration: Duration(seconds: 2),
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.red,
    borderRadius: 15,
    messageText: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text:
                                                                  "Subscription expired please".tr,
                                                            // .
                                                        
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    recognizer: TapGestureRecognizer()
                                                                      ..onTap =   () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return AlertDialog(
                                                                                    scrollable: true,
                                                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                    content: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.topRight,
                                                                                          child: IconButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              size: 33,
                                                                                              color: Color(0xFF3B3B98),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Image.asset('assets/images/failed.png'),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        Text(
                                                                                          'Sorry'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.01,
                                                                                        ),
                                                                                        Text(
                                                                                          'Please pay the subscription fee of 300 R.S'.tr,
                                                                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: heightApp * 0.03,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: widthApp * 0.33,
                                                                                          height: heightApp * 0.044,
                                                                                          child: ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Theme.of(context).primaryColor,
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                // print(GetStorage().read("activityID"));

                                                                                                // controller.companyID = controller.CompanyList[index].companyID;
                                                                                                
                                                                                        try {
                                                                                                  var items = await GetPayment(controller.companyID, controller.token);
                                                                                                  controller.url.value = items.data!;
                                                                                                  print("^^^^^^^6");
                                                                                                  print(controller.url.value.toString());
                                                                                                  controller.update();

                                                                                                  Get.back();

                                                                                                  Completer<WebViewController> _controller = Completer<WebViewController>();

                                                                                                  showDialog(
                                                                                                      context: context,
                                                                                                      builder: (BuildContext context) {
                                                                                                        controller.dialogContext = context;
                                                                                                        return AlertDialog(
                                                                                                          scrollable: true,
                                                                                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                          content: Column(
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: Alignment.topRight,
                                                                                                                child: IconButton(
                                                                                                                  onPressed: () {
                                                                                                                    Navigator.of(context).pop();
                                                                                                                    print(controller.url.value);
                                                                                                                  },
                                                                                                                  icon: const Icon(
                                                                                                                    Icons.close,
                                                                                                                    size: 33,
                                                                                                                    color: Color(0xFF3B3B98),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Obx(() => Container(
                                                                                                                    height: 500,
                                                                                                                    width: 400,
                                                                                                                    child: WebView(
                                                                                                                      onWebViewCreated: (controller) {
                                                                                                                        _controller.complete(controller);
                                                                                                                      },
                                                                                                                      zoomEnabled: false,
                                                                                                                      debuggingEnabled: true,
                                                                                                                      initialUrl: controller.url.value.toString(),
                                                                                                                      javascriptMode: JavascriptMode.unrestricted,
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      });
                                                                                                } catch (e) {
                                                                                                  if (Get.isDialogOpen == true) Get.back();
                                                                                                   }
                                                                                              },
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  "Pay".tr,
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w700,
                                                                                                    color: kwhite,
                                                                                                  ),
                                                                                                ),
                                                                                              )),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });},
                                                                    text:
                                                                        ' pay now'.tr,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // TextSpan(text: ' world!'),
                                                              ],
                                                            ),
                                                          ),
    isDismissible: true,
    forwardAnimationCurve: Curves.bounceInOut,
    barBlur: 50,
    snackPosition: SnackPosition.TOP,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
  ):print('fgfg');










                                    
                                        controller.itemTypeID != null
                                        ?controller.key.currentState?.reset()
                                        :print('jfjfjkkj');
                                        print(value.taxValue.toString());
                                        controller.tax = int.parse(
                                                value.taxValue.toString()) /
                                            100;
                                        print(controller.tax);
                                        controller.companyID = value.companyID;
                                        print(value.companyEName.toString());
                                        controller.ishastax = value.ishasTax;
                                    
                                        controller.fetchMYItems();  
                                        controller.key.currentState?.reset(); 
                                         controller.update();
                                      },
                                    );
                                  }).toList()
                                : controller.ActivityList.map((value) {
                                    return DropdownMenuItem<int>(
                                      value: value.companyID,
                                      child: Text(value.companyAName!),
                                      onTap: () {
    controller.isActive= value.subscription![0].isActive!;
                                        controller.tax = int.parse(
                                                value.taxValue.toString()) /
                                            100;
                                        print(controller.tax);
                                        controller.companyID = value.companyID;
                                        controller.update();
                                        controller.ishastax = value.ishasTax;
                                        controller.fetchMYItems();

                                      },
                                    );
                                  }).toList(),
                            hintText: 'Company selection'.tr,
                          ),
                         controller.isActive == true    
                        ?  Column(
                            children: [
                              Form(
                                key: controller.key,
                                child: Dropdown(
                         
                                 onChanged: (p0) {
                                   controller.key1.currentState!.reset();
                                 },
                                  validator: (value) {
                                    print(value.runtimeType);
                                    if (value == null) {
                                      return 'Please select a Categorie'.tr;
                                    }

                                    return null;
                                  },
                                  items: lang.appLocale == 'en'
                                      ? controller.ItemsList.map((value) {
                                          return DropdownMenuItem<int>(
                                            value: value.itemTypeID,
                                            child: Text(value.itemTypeEName!),
                                            onTap: () {

                                              controller.itemTypeID =
                                                  value.itemTypeID;
                                              controller.itemTypeName =
                                                  value.itemTypeEName;

                                              controller.itemTypeEName =
                                                  value.itemTypeEName;
                                              controller.fetchMYServices();
                                            },
                                          );
                                        }).toList()
                                      : controller.ItemsList.map((value) {
                                          return DropdownMenuItem<int>(
                                            value: value.itemTypeID,
                                            child: Text(value.itemTypeAName!),
                                            onTap: () {
                                              controller.itemTypeID =
                                                  value.itemTypeID;
                                              controller.itemTypeName =
                                                  value.itemTypeAName;
                                              controller.itemTypeAName =
                                                  value.itemTypeAName;
                                              controller.fetchMYServices();
                                              controller.update();
                                            },
                                          );
                                        }).toList(),
                                  hintText: 'Categorie selection'.tr,
                                ),
                              ),
                        
                          Form(
                            key: controller.key1,
                            child: Dropdown(
                               
                              onChanged: (p0) {
                                
                              },
                              validator: (value) {
                                print(value.runtimeType);
                                if (value == null) {
                                  return 'Please select a product'.tr;
                                }

                                return null;
                              },
                              items: lang.appLocale == 'en'
                                  ? controller.ServicesList.map((value) {
                                      return DropdownMenuItem<int>(
                                        value: value.itemID,
                                        child: Text(value.itemEName!),
                                        onTap: () async{
                                          
print("^^^^^^^^^^^^^^^^^^");
                                          value.itemDetails!.isEmpty
                                              ? showErrorSnackBar(
                                                  'No quantity in stock'.tr)
                                              : print('########');
                                          ID = value.itemID.toString();
                                          Name = value.itemAName.toString();
                                          controller.Price = value.itemDetails![0].itemPrice;
                                          Count = value.itemDetails![0].itemCount;
                                          print(Count);
                                          print("^^^^^^^^^^^^^^^^^^");
                                          print(controller.Price);
                                          print(Name);
                                              controller.update();
                                        },
                                      );
                                    }).toList()
                                  : controller.ServicesList.map((value) {
                                      return DropdownMenuItem<int>(
                                        value: value.itemID,
                                        child: Text(value.itemAName!),
                                        onTap: () {
                                          ID = value.itemID.toString();
                                          Name = value.itemAName.toString();
                                          controller.Price = value.itemDetails![0].itemPrice;
                                          Count = value.itemDetails![0].itemCount;
                                          print("^^^^^^^^^^^^^^^^^^");
                                          print(controller.Price);
                                          print(Name);
                                          controller.update();
                                        },
                                      );
                                    }).toList(),
                              hintText: 'product selection'.tr,
                            ),
                          ),
                           GreyTextField(
                            onChanged: (value){
                              controller.countController.clear();
                            },
                            controller: controller.priceController,
                            label:controller.Price == null 
                        ? controller.Price = 'Product/service price'.tr.toString() 
                        : controller.Price == 'Product/service price'.tr.toString()
                        
                        ? controller.Price.toString()
                        :"${'Base price for a product/service'.tr}: "+
                        controller.Price.toString()
                          
                            ),
                          BoxTextField(
                              onChanged: (value) {
                                if (controller
                                    .countController.text.isNotEmpty) {
                                  if (int.parse(
                                          controller.countController.text) <=
                                      Count) {
                                    total =
                                    
                                    controller.priceController.text.toString() == ''
                                    
                                   ?  double.parse(controller.Price.toString())  *
                                        int.parse(
                                            controller.countController.text)
                                   
                                   : double.parse(controller.priceController.text.toString()) *
                                        int.parse(
                                            controller.countController.text);
                                   
                                    // *
                                    //     int.parse(
                                    //         controller.countController.text);

                                    controller.ishastax != true
                                        ? controller.totalController.text =
                                            ( controller.priceController.text.toString() == ''
                                    
                                   ?  double.parse(controller.Price.toString())  *
                                        int.parse(
                                            controller.countController.text)
                                   
                                   : double.parse(controller.priceController.text.toString()) *
                                        int.parse(
                                            controller.countController.text))
                                                .toString()
                                        : controller.totalController.text =
                                            total.toString();
                                    totalWithTax =
                                        (total! + (total! * controller.tax));

                                    controller.ishastax == true
                                        ? controller
                                                .totalWithTaxController.text =
                                            (total! + (total! * controller.tax))
                                                .toString()
                                        : controller.totalWithTaxController
                                            .text = total.toString();
                                  } else {
                                    showErrorSnackBar(
                                        'Quantity in stock'.tr + ' $Count');
                                  }
                                } else {
                                  controller.totalController.clear();
                                  controller.totalWithTaxController.clear();
                                }
                                controller.update();
                              },
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                return controller.validate(value!);
                              },
                              controller: controller.countController,
                              label: "Count".tr),
                          GreyTextField(
                            readOnly: true,
                            controller: controller.totalController,
                            label: "Total".tr,
                          ),
                          GreyTextField(
                            readOnly: true,
                            controller: controller.totalWithTaxController,
                            label: "Total including tax".tr,
                          ),
                          SizedBox(
                            height: heightApp * 0.04,
                          ),
                          SizedBox(
                            height: heightApp * 0.066,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(
                                        width: widthApp * 0.01,
                                      ),
                                      Text(
                                        "Add product".tr,
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () async {
                                  if (controller.ADDitemFormKey.currentState!
                                      .validate()) {
                                    totalAmount +=  controller.priceController.text.toString() == ''
                                    
                                   ?  double.parse(controller.Price.toString())  *
                                        int.parse(
                                            controller.countController.text)
                                   
                                   : double.parse(controller.priceController.text.toString()) *
                                        int.parse(
                                            controller.countController.text);
                                    print(totalAmount);

                                    print(Listdata);
                                    Listdata.add({
                                      'ItemID': ID.toString(),
                                      'ItemName': Name.toString(),
                                      'ItemPrice':controller.priceController.text == ''
                                      ?controller.Price
                                      :controller.priceController.text,
                                      'Count': controller.countController.text,
                                      'Amount': controller.totalController.text,
                                      'Total':
                                          controller.totalWithTaxController.text
                                    });
                                    showSuccessSnackBar("Added successfully".tr);
                                    controller.countController.text = '';
                                    controller.totalController.text = '';
                                    controller.totalWithTaxController.text = '';
                                     controller.priceController.clear();
                                      //  controller.Price = null;
                                        //  controller.ADDitemFormKey.currentState!
                                        // .reset();
                                  }
                                  print(controller.Price);
                                  print("############");
                                  print(Listdata.length.toString());

                                  controller.update();
                                }),
                          ),
                          SizedBox(
                            height: heightApp * 0.04,
                          ),
                          ListView(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            children: Listdata.map((document) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(59, 59, 152, 0.2),
                                      blurRadius: 30,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Slidable(
                                  closeOnScroll: false,
                                  // create a key
                                  key: const ValueKey('key'),

                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      12.0))),
                                                  content: Text(
                                                      "Are you sure to delete this service?"
                                                          .tr),
                                                  actionsAlignment:
                                                      MainAxisAlignment.center,
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text(
                                                        "yes".tr,
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                      onPressed: () {
                                                        print(document['Count']
                                                            .toString());
                                                        print(controller.Price.toString());
                                                        totalAmount -= (int
                                                                .parse(document[
                                                                    'Count']) *
                                                            double.parse(controller.Price
                                                                .toString()));

                                                        Listdata.remove(
                                                            document);
                                                        controller.update();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text("cancel".tr),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: Container(
                                          height: 100,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 85,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(12),
                                            ),
                                          ),
                                          child: Image.asset(
                                              'assets/images/trash.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "product name".tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                Text(
                                                  document['ItemName']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Count".tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                Text(
                                                  document['Count'].toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Total".tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                Text(
                                                  document['Amount'].toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "الاجمالي (ش.ض)",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                controller.ishastax == true
                                                    ? Text(
                                                        document['Total']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      )
                                                    : Text(
                                                        document['Amount']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          Listdata.isNotEmpty
                              ? MainButton(
                                  text: "Show".tr,
                                  press: () async {
                                    controller.ADDitemFormKey.currentState!
                                        .reset();
                                          controller.Price = null;
                                    print(totalAmount + 1.5);
                                    print(totalAmount + (totalAmount * 0.15));
                                    // print(controller.id);
                                    print(controller.email);
                                    print(Listdata);
                                    print(controller.token);
                                    Get.dialog(
                                      AlertDialog(
                                        scrollable: true,
                                        content: Column(
                                          children: [
                                            Text(
                                              'please wait...'.tr,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Custom_ProgressIndicator()
                                          ],
                                        ),
                                      ),
                                      barrierDismissible: false,
                                    );
                                    var checkVat = controller.ishastax;
                                    var total =
                                        totalAmount + (totalAmount * controller.tax);
                                    print("%%%%%%%%%%%%%%%");
                                    print(checkVat);
                                    var totalCheck;
                                    if (checkVat == false) {
                                      totalCheck = totalAmount;
                                    } else {
                                      totalCheck = total;
                                    }
                                    print("%%%%%%%%%%%%%%%");
                                    print(totalAmount);
                                    print(totalCheck);

                                    try {
                                      final _res = await AddInvoice(
                                          totalAmount: totalAmount,
                                          totalIncludingTax: totalCheck,
                                          activityID: controller.companyID,
                                          email: controller.email.toString(),
                                          invoiceDetails: Listdata,
                                          token: controller.token);
                                      if (Get.isDialogOpen == true) Get.back();
                                      print("*******************");
                                      if (_res.code == 200) {
                                        Get.toNamed(Routes.INVOICE, arguments: [
                                          _res.data![0].companyID.toString(),
                                          lang.appLocale == 'en'
                                              ? _res.data![0].companyEName
                                                  .toString()
                                              : _res.data![0].companyAName
                                                  .toString(),
                                          _res.data![0].address.toString(),
                                          _res.data![0].taxNumber.toString(),
                                          _res.data![0].activityLogo.toString(),
                                          _res.data![0].invoiceID.toString(),
                                          _res.data![0].totalAmount.toString(),
                                          _res.data![0].totalIncludingTax
                                              .toString(),
                                          _res.data![0].registerDate.toString(),
                                          _res.data![0].registerTime.toString(),
                                          Listdata.toList(),
                                          datalist.toString()
                                        ]);
                                        Listdata.clear();
                                      }
                                      datalist = Listdata.length.toString();
                                      showSuccessSnackBar(
                                          'Your invoice has been issued successfully'
                                              .tr);
                                      Get.toNamed(Routes.INVOICE, arguments: [
                                        _res.data![0].companyID.toString(),
                                        lang.appLocale == 'en'
                                            ? _res.data![0].companyEName
                                                .toString()
                                            : _res.data![0].companyAName
                                                .toString(),
                                        _res.data![0].address.toString(),
                                        _res.data![0].taxNumber.toString(),
                                        _res.data![0].activityLogo.toString(),
                                        _res.data![0].invoiceID.toString(),
                                        _res.data![0].totalAmount.toString(),
                                        _res.data![0].totalIncludingTax
                                            .toString(),
                                        _res.data![0].registerDate.toString(),
                                        _res.data![0].registerTime.toString(),
                                        Listdata.toList(),
                                        datalist.toString()
                                      ]);
                                      Listdata.clear();
                                    } catch (e) {
                                      if (Get.isDialogOpen == true) Get.back();
                                      showErrorSnackBar(
                                          'There is an error, please try again'
                                              .tr);
                                    }
                                  })
                              : Container(),
                          SizedBox(
                            height: heightApp * 0.06,
                          ),
                        ],
                      ):SizedBox(height: heightApp*0.01,)
                      ],
                          ),  ),
                  ));
                })),
      ),
    );
  }
}
