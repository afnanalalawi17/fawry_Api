import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/invoice_purchase_Model.dart';
import 'package:fawry_app/app/modules/History2/controllers/history2_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final cont = Get.put(History2Controller());
Future<Data_invoice_purchase> add_invoice_purchase(
  // int itemID,
  int supplierID,
  int companyID,
  String desc,
  // String itemPrice,
  // String purchasePrice,
  // String itemCount,
  String email,
  var totalAmount,
  var totalIncludingTax,
  dynamic token,
  List? itemPurchase
) async {
  final Map<String, dynamic> Data = {
  
    'SupplierID': supplierID,
    'CompanyID': companyID,
    // 'ItemPrice': itemPrice,
    // 'PurchasePrice': purchasePrice,
    // 'ItemCount': itemCount,
    'TotalAmount': totalAmount,
    'TotalIncludingTax':totalIncludingTax,
    'ItemPurchase':itemPurchase,
    'Email': email,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}ItemPurchase'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  // print(jsonDecode(response.body));
  // return User.fromJson(jsonDecode(response.body));
  var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {

     print("*******************************add_invoice_purchase************************");
    var parsed = jsonDecode(response.body)['data'][0];
    cont.addres = parsed['address'].toString();
    cont.phoneInvoice = parsed['phoneNo'].toString();
    // cont.commercialRecordNo=parsed['commercialRecordNo'].toString();
    // cont.taxNumber=parsed['taxNumber'].toString();
    // cont.taxValue=parsed['taxValue'].toString();
    cont.invoiceId=parsed['itemHistoryID'].toString();
    cont.registerDate=parsed['registerDate'].toString();
   print( jsonDecode(response.body.toString()));
 
    return Data_invoice_purchase.fromJson(json.decode(response.body.toString()));
  }
  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body));

  return Future.error(jsonDecode(response.body.toString()));
}
