
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/Activity.dart';
import 'package:fawry_app/app/data/Model/AddServices_Model.dart';
import 'package:fawry_app/app/data/Model/Add_invoice_Model.dart';
import 'package:fawry_app/app/data/Model/invoice_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:lancera/app/data/models/user_model.dart';
  invoice_Model? invoicesModel;
Future<invoice_Model> InvoicesByDate(
int companyID,dynamic token,String fromDate, String toDate

) async {
final Map<String, dynamic> Data = {

    'CompanyID':companyID,
    'FromDate':fromDate,
    'ToDate':toDate

  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}InvoicesByDate'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
       'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Data),
  );
  
 var status = jsonDecode(response.body.toString())['code'].toString();

  if (status== '200' ) {
     var jsonString = response.body;

    // then parse the JSON.
   print("---------------------------DATA INVOICES USER---------------------------");
   print(jsonString);
invoicesModel = invoice_Model.fromJson(json.decode(response.body));

    return invoice_Model.fromJson(json.decode(response.body));
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