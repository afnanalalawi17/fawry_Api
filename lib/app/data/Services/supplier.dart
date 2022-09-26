import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/Supplier_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Supplier_Model> GetSupplier(int companyID, dynamic token) async {
  final Map<String, dynamic> Data = {
    'CompanyID': companyID,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}Suppliers'),
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
    return Supplier_Model.fromJson(json.decode(response.body));
  }

  print(jsonDecode(response.statusCode.toString()));

  print(jsonDecode(response.body.toString()));
  return Future.error(response.statusCode);
}
