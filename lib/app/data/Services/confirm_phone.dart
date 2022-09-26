

import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/User_Login.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

 User_Login? UserDataModel;

Future<bool> ConfirmMobileNo(String email, String code,dynamic token) async {
  final Map<String, dynamic> loginData = {
    'Email': email,
    'VerficationCode': code,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}ConfirmMobileNo'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',

    },
    body: jsonEncode(loginData),
  );
  // return User.fromJson(jsonDecode(response.body));

  var status = jsonDecode(response.body.toString())['code'].toString();

  if (status== '200' ) {
    var jsonString = response.body;

    // then parse the JSON.
    print("*******************************");
  var status = jsonDecode(response.body.toString())['code'].toString();
  print(status);
    print(jsonDecode(response.statusCode.toString()));
    print(jsonDecode(response.body.toString()));
    print(' Success from api');
    GetStorage().write('mobileNoConfirmed',code);
    return true;

    // then throw an exception.

    //throw Exception('......');
  }

  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body.toString()));
  print('error  from api');

  return Future.error(response.body);
}
