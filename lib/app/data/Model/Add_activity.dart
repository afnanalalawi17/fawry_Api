import 'dart:convert';
AddActivity userDataFromJson(String str) => AddActivity.fromJson(json.decode(str));

String userDataToJson(AddActivity data) => json.encode(data.toJson());

class AddActivity {
  int? code;
  List<Data>? data;
  String? message;

  AddActivity({this.code, this.data, this.message});

  AddActivity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? companyID;
  String? companyAName;
  String? companyEName;
  String? companyTypeAName;
  String? companyTypeEName;
  bool? ishasTax;
  String? address;
  bool? isActive;
  bool? isPaid;
  String? phoneNo;
  String? taxNumber;
  String? taxValue;
  String? countryAName;
  String? countryEName;
  String? currencyAName;
  String? currencyEName;
  String? subscriptionTypeAName;
  String? subscriptionTypeEName;
  String? commercialRecordExperDate;
  String? commercialRecordNo;
  String? companyLogo;

  Data(
      {this.companyID,
      this.companyAName,
      this.companyEName,
      this.companyTypeAName,
      this.companyTypeEName,
      this.ishasTax,
      this.address,
      this.isActive,
      this.isPaid,
      this.phoneNo,
      this.taxNumber,
      this.taxValue,
      this.countryAName,
      this.countryEName,
      this.currencyAName,
      this.currencyEName,
      this.subscriptionTypeAName,
      this.subscriptionTypeEName,
      this.commercialRecordExperDate,
      this.commercialRecordNo,
      this.companyLogo});

  Data.fromJson(Map<String, dynamic> json) {
    companyID = json['companyID'];
    companyAName = json['companyAName'];
    companyEName = json['companyEName'];
    companyTypeAName = json['companyTypeAName'];
    companyTypeEName = json['companyTypeEName'];
    ishasTax = json['ishasTax'];
    address = json['address'];
    isActive = json['isActive'];
    isPaid = json['isPaid'];
    phoneNo = json['phoneNo'];
    taxNumber = json['taxNumber'];
    taxValue = json['taxValue'];
    countryAName = json['countryAName'];
    countryEName = json['countryEName'];
    currencyAName = json['currencyAName'];
    currencyEName = json['currencyEName'];
    subscriptionTypeAName = json['subscriptionTypeAName'];
    subscriptionTypeEName = json['subscriptionTypeEName'];
    commercialRecordExperDate = json['commercialRecordExperDate'];
    commercialRecordNo = json['commercialRecordNo'];
    companyLogo = json['companyLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['companyAName'] = this.companyAName;
    data['companyEName'] = this.companyEName;
    data['companyTypeAName'] = this.companyTypeAName;
    data['companyTypeEName'] = this.companyTypeEName;
    data['ishasTax'] = this.ishasTax;
    data['address'] = this.address;
    data['isActive'] = this.isActive;
    data['isPaid'] = this.isPaid;
    data['phoneNo'] = this.phoneNo;
    data['taxNumber'] = this.taxNumber;
    data['taxValue'] = this.taxValue;
    data['countryAName'] = this.countryAName;
    data['countryEName'] = this.countryEName;
    data['currencyAName'] = this.currencyAName;
    data['currencyEName'] = this.currencyEName;
    data['subscriptionTypeAName'] = this.subscriptionTypeAName;
    data['subscriptionTypeEName'] = this.subscriptionTypeEName;
    data['commercialRecordExperDate'] = this.commercialRecordExperDate;
    data['commercialRecordNo'] = this.commercialRecordNo;
    data['companyLogo'] = this.companyLogo;
    return data;
  }
}