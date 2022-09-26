

import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/User_Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

 User_Login? UserDataModel;

Future<User_Login> Login(String phoneORemail, String password) async {
  final Map<String, dynamic> loginData = {
    'Email': phoneORemail,
    'Password': password,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}login'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    
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
    print('login Success from api');

        return User_Login.fromJson(json.decode(response.body));

    // then throw an exception.

    //throw Exception('......');
  }

  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body.toString()));
  print('error login from api');

  return Future.error(response.body);
}
