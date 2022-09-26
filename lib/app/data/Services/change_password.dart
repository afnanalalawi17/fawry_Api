import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> StartChangePass(String oldpass, String password, String confirm,
    String email, dynamic token) async {
  final Map<String, dynamic> Data = {
    'Password': oldpass,
    'newPassword': password,
    'ConfirmPassword': confirm,
    'Email': email,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}ChangePassword'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    print("sucess data");
    print(jsonDecode(response.body));
    return 'true';
  }
  print("error data");
  print(jsonDecode(response.statusCode.toString()));

  print(jsonDecode(response.body.toString()));
  return Future.error(response.statusCode);
}
