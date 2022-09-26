import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> StartResetPass(String password,String code, String email) async {
  final Map<String, dynamic> Data = {
    'Email': email,
    'newPassword': password,
    'ConfirmPassword': password,
    'VerficationCode':code
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}ForgotPassword'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(Data),
  );
 var status = jsonDecode(response.body.toString())['code'].toString();

  if (status== '200' ) {
    print(jsonDecode(response.body));
    return true;
  }  print(jsonDecode(response.statusCode.toString()));

  print(jsonDecode(response.body.toString()));
  return Future.error(response.statusCode);
}
