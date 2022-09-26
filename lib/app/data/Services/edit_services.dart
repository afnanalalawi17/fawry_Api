
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/AddServices_Model.dart';
import 'package:fawry_app/app/data/Model/Add_activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AddServices_Model> edit_Services(

  String itemPrice,
 String itemId,


  String  email,
  dynamic token,
 
) async {
  final Map<String, dynamic> Data = {
   
    'ItemPrice': itemPrice,
   
    'ItemID': itemId,

    'Email':email

  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}Updateitem'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
       'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  // print(jsonDecode(response.body));
  // return User.fromJson(jsonDecode(response.body));
var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    var jsonString = response.body;
    print(jsonDecode(response.body));
      return AddServices_Model.fromJson(json.decode(response.body));

  }
  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body));
 
  return Future.error(jsonDecode(response.body.toString()));}