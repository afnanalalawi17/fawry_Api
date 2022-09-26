
import 'dart:convert';

Activity userDataFromJson(String str) => Activity.fromJson(json.decode(str));

String userDataToJson(Activity data) => json.encode(data.toJson());

class Activity {
  int? code;
  List<DataCompany>? data;
  String? message;

  Activity({this.code, this.data, this.message});

  Activity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataCompany>[];
      json['data'].forEach((v) {
        data!.add(new DataCompany.fromJson(v));
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

class DataCompany {
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
  String ? taxValue;
  String? countryAName;
  String? countryEName;
  String? currencyAName;
  String? currencyEName;
  List<Subscription>? subscription;
  String? commercialRecordExperDate;
  String? commercialRecordNo;
  String? companyLogo;

  DataCompany(
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
      this.subscription,
      this.commercialRecordExperDate,
      this.commercialRecordNo,
      this.companyLogo});

  DataCompany.fromJson(Map<String, dynamic> json) {
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
    if (json['subscription'] != null) {
      subscription = <Subscription>[];
      json['subscription'].forEach((v) {
        subscription!.add(new Subscription.fromJson(v));
      });
    }
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
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.map((v) => v.toJson()).toList();
    }
    data['commercialRecordExperDate'] = this.commercialRecordExperDate;
    data['commercialRecordNo'] = this.commercialRecordNo;
    data['companyLogo'] = this.companyLogo;
    return data;
  }
}

class Subscription {
  int? subscriptionID;
  String? startDate;
  String? endDate;
  bool? isActive;
  bool? isPaid;
  int? subscriptionTypeID;
  String? subscriptionTypeAName;
  String? subscriptionTypeEName;
  int? period;

  Subscription(
      {this.subscriptionID,
      this.startDate,
      this.endDate,
      this.isActive,
      this.isPaid,
      this.subscriptionTypeID,
      this.subscriptionTypeAName,
      this.subscriptionTypeEName,
      this.period});

  Subscription.fromJson(Map<String, dynamic> json) {
    subscriptionID = json['subscriptionID'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isActive = json['isActive'];
    isPaid = json['isPaid'];
    subscriptionTypeID = json['subscriptionTypeID'];
    subscriptionTypeAName = json['subscriptionTypeAName'];
    subscriptionTypeEName = json['subscriptionTypeEName'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriptionID'] = this.subscriptionID;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isActive'] = this.isActive;
    data['isPaid'] = this.isPaid;
    data['subscriptionTypeID'] = this.subscriptionTypeID;
    data['subscriptionTypeAName'] = this.subscriptionTypeAName;
    data['subscriptionTypeEName'] = this.subscriptionTypeEName;
    data['period'] = this.period;
    return data;
  }
}