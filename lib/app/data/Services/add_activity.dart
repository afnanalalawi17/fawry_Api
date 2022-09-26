
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:fawry_app/app/data/Model/Add_activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AddActivity> add_activity(
  String companyAName,
  String companyEName,
  String address,
  String taxNumber,
  String taxValue,
  String commercialRecordNo,
  String currencyID,
  String countryID,
  String  commercialRecordExperDate,
  String  phoneNo,  String  companyLogo,
  bool ishasTax,
  
  String  email,
  dynamic token,
 
) async {
  final Map<String, dynamic> Data = {
    'CompanyAName': companyAName,
     'CompanyEName': companyEName,
    'Address': address,
    'TaxNumber': taxNumber,
    'TaxValue': taxValue,
    'CommercialRecordNo': commercialRecordNo,
    'CompanyTypeID':1,
    'CurrencyID':currencyID,
    'CountryID':countryID,
    'CommercialRecordExperDate':commercialRecordExperDate,
    'SubscriptionTypeID':1,
    'PhoneNo':phoneNo,
    'CompanyLogo':companyLogo,
    'Email':email,
    'ishasTax': ishasTax

  };
  final http.Response response = await http.post(
    Uri.parse('${APIUrl}RegisterCompany'),
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

    
       return userDataFromJson(jsonString);


  }
  print(jsonDecode(response.statusCode.toString()));
  print(jsonDecode(response.body));
 
  return Future.error(jsonDecode(response.body.toString()));}