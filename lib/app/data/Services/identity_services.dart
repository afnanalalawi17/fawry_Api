import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Shared/widget/constants.dart';


Future<bool> GetforgetPassOTP(String email ) async {
  final Map<String, dynamic> Data = {
    'Email': email,
 
    
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}RequestForgotPassword'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: jsonEncode(Data),
  ); var status = jsonDecode(response.body.toString())['code'].toString();

  if (status== '200' ) {

    print(jsonDecode(response.body));
    return true;
  }
  print(jsonDecode(response.body.toString()));
  return  Future.error(response.body);
}
