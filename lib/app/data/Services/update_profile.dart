import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/User_Login.dart';
import 'package:fawry_app/app/data/Model/User_data.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User_Login> Update_ProfileUser(String firstname, String lastname,
    String email, String phone, dynamic token) async {
  final Map<String, dynamic> Data = {
    'first_name': firstname,
    'last_name': lastname,
    'Email': email,
    'MobileNo': phone,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}UpdateProfile'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    var jsonString = response.body;
    print(jsonDecode(response.body));
    print("*******************************");
    var status = jsonDecode(response.body.toString())['code'].toString();
    print(status);
    print(jsonDecode(response.statusCode.toString()));
    print(jsonDecode(response.body.toString()));
    print(' Success from api');

    print(GetStorage().write('firstName', firstname));
    print(GetStorage().write('lastName', lastname));
    print(GetStorage().write('phone', phone));

    return userLoginDataFromJson(jsonString);
  }
  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body));

  return Future.error(response.statusCode);
}
