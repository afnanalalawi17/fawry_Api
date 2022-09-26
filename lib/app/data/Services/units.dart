import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/units.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<units> GetUnits( dynamic token) async {
  // final Map<String, dynamic> Data = {
  //   // 'Email': email,
  //   // 'Password': oldpass,
  //   // 'ConfirmPassword': password,
  //   // 'newPassword':password
  // };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}Units'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
       'Authorization': 'Bearer $token',
    },
    // body: jsonEncode(Data),
  ); var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    print(jsonDecode(response.body));
     return units.fromJson(json.decode(response.body));
  }  
  
  print(jsonDecode(response.statusCode.toString()));

  print(jsonDecode(response.body.toString()));
  return Future.error(response.statusCode);
}
