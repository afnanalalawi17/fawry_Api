import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/modules/History2/controllers/history2_controller.dart';
import 'package:fawry_app/app/modules/History2/views/history2_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
  final lang = Get.put(History2Controller());

 RegisterSupplier(
    int companyID,
    String email,
    String supplierAName,
    String supplierEName,
    String phoneNumber,
    String address,
    String commercialRecordNo,
    dynamic token) async {
  final Map<String, dynamic> Data = {
    'CompanyID': companyID,
    'Email': email,
    'SupplierAName': supplierAName,
    'SupplierEName': supplierEName,
    'PhoneNumber': phoneNumber,
    'Address': address,
    'CommercialRecordNo':commercialRecordNo
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}RegisterSupplier'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    print(jsonDecode(response.body));
       lang.fetchMYSupplier(companyID);
                                                             
                                                                    
    return jsonDecode(response.body.toString());
  }
  print(jsonDecode(response.statusCode.toString()));

  print(jsonDecode(response.body.toString()));
  return Future.error(response.statusCode);
}
