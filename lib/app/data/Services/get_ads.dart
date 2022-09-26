import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/Ads_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<Ads_Model> GetAds(

 
  dynamic token,
 
) async {
  // final Map<String, dynamic> Data = {

  

  // };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}adsList'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
       'Authorization': 'Bearer $token',
    },
    // body: jsonEncode(Data),
  );
  // print(jsonDecode(response.body));
  // return User.fromJson(jsonDecode(response.body));
var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    var jsonString = response.body;
   print(jsonDecode(response.body));
        return Ads_Model.fromJson(json.decode(response.body));
  }
  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body));
 
  return Future.error(jsonDecode(response.body.toString()));}