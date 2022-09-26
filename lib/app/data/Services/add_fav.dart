import 'dart:ffi';

import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/Add_Fav_Model.dart';
import 'package:fawry_app/app/data/Model/User_data.dart';
import 'package:fawry_app/app/data/Model/Add_invoice_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:lancera/app/data/models/user_model.dart';
Future<Add_Favorite_Model> AddFavorite(
  int? invoiceID,
  String? email,
  dynamic token,
) async {
  final Map<String, dynamic> Data = {
    'InvoiceID': invoiceID,
    'Email': email,
  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}FavoriteInvoice'),
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

    // then parse the JSON.
    print(jsonDecode(response.body));
    return Add_Favorite_Model.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //return 'error';

    print(jsonDecode(response.body));
    print(jsonDecode(response.statusCode.toString()));
    return Future.error(response.statusCode);

    // throw Exception('Login Faild');
  }
}
