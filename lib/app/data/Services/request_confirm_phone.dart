import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> StartRequestConfirmMobileNo( String email,dynamic token) async {
  final Map<String, dynamic> Data = {
    'Email': email,
 
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}RequestConfirmMobileNo'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
       'Authorization': 'Bearer $token',
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
