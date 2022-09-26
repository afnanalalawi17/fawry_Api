
import 'package:fawry_app/Shared/widget/Snack_Bar.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/User_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// import 'package:lancera/app/data/models/user_model.dart';
 UserData? UserDataModel;
Future<UserData> Register({
  
  String? firstnameAR,
  String? lastnameAR,
  String? firstnameEN,
  String? lastnameEN,
  String? phone,
  String? email,
  String? password,

}) async {
  final Map<String, dynamic> Data = { 
    'Email': email,
    'first_name': firstnameAR,
    'last_name': lastnameAR,
    'first_name_en':firstnameEN,
    'last_name_en':lastnameEN,
    'MobileNo': phone,
   
    'Password':password
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}customerRegister'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: jsonEncode(Data),
  );
  // print(jsonDecode(response.body));
  // return User.fromJson(jsonDecode(response.body));
 var status = jsonDecode(response.body.toString())['code'].toString();
print(Data);
  if (status== '200' ) {
     var jsonString = response.body;
print('sucess');
    // then parse the JSON.
    print(jsonDecode(response.body));
        return UserData.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //return 'error';
print('error');
    print(jsonDecode(response.body));
    print(status);
    print(jsonDecode(response.statusCode.toString()));
      // var ex = 'The account is already registered'.tr;
      //   showErrorSnackBar(ex);
    return Future.error(response.statusCode);

    // throw Exception('Login Faild');
  }
}
