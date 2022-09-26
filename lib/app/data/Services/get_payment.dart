import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/payment_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Payment_Model> GetPayment(int id, dynamic token) async {
  final Map<String, dynamic> Data = {'CompanyID': id};
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}GetPaymentURL'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    }, 
    body: jsonEncode(Data),

  );
  //return User.fromJson(jsonDecode(response.body));

var status = jsonDecode(response.body.toString())['code'].toString();

  if (status == '200') {
    var items = json.decode(response.body);

    print("----------------------------------");
// print(activityID);
    print(token);
    print(response.body.toString());
    // print(json.decode(response.body.toString()));
    // then parse the JSON.

    return Payment_Model.fromJson(json.decode(response.body));

    // then throw an exception.

    //throw Exception('......');

  } else {
    //TODO: remove this line
    print('error get Categores  from api');
    // print(activityID);
    print(token);
    print(json.decode(response.statusCode.toString()));

    print(json.decode(response.body.toString()));

    return Future.error(json.decode(response.body.toString()));
  }
}
