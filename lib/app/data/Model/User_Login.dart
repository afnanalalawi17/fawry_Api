

import 'dart:convert';

User_Login userLoginDataFromJson(String str) => User_Login.fromJson(json.decode(str));

String userLoginDataToJson(User_Login data) => json.encode(data.toJson());
class User_Login {
  int ?code;
  List<Data>? data;
  String ?message;

  User_Login({this.code, this.data, this.message});

  User_Login.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String ?firstName;
  String? lastName;
  String? mobileNo;
  bool? mobileNoConfirmed;
  List<Activites>? activites;
  String? token;
  String? roleName;

  Data(
      {this.email,
      this.firstName,
      this.lastName,
      this.mobileNo,
      this.mobileNoConfirmed,
      this.activites,
      this.token,
      this.roleName});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobileNo'];
    mobileNoConfirmed = json['mobileNoConfirmed'];
    if (json['activites'] != null) {
      activites = <Activites>[];
      json['activites'].forEach((v) {
        activites!.add(new Activites.fromJson(v));
      });
    }
    token = json['token'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobileNo'] = this.mobileNo;
    data['mobileNoConfirmed'] = this.mobileNoConfirmed;
    if (this.activites != null) {
      data['activites'] = this.activites!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['roleName'] = this.roleName;
    return data;
  }
}

class Activites {
  int ?activityID;
  String? activityName;
  String? address;
  bool? isActive;
  bool? isPaid;
  String ?phoneNo;
  String ?commercialRecordExperDate;
  String ?commercialRecordNo;

  Activites(
      {this.activityID,
      this.activityName,
      this.address,
      this.isActive,
      this.isPaid,
      this.phoneNo,
      this.commercialRecordExperDate,
      this.commercialRecordNo});

  Activites.fromJson(Map<String, dynamic> json) {
    activityID = json['activityID'];
    activityName = json['activityName'];
    address = json['address'];
    isActive = json['isActive'];
    isPaid = json['isPaid'];
    phoneNo = json['phoneNo'];
    commercialRecordExperDate = json['commercialRecordExperDate'];
    commercialRecordNo = json['commercialRecordNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityID'] = this.activityID;
    data['activityName'] = this.activityName;
    data['address'] = this.address;
    data['isActive'] = this.isActive;
    data['isPaid'] = this.isPaid;
    data['phoneNo'] = this.phoneNo;
    data['commercialRecordExperDate'] = this.commercialRecordExperDate;
    data['commercialRecordNo'] = this.commercialRecordNo;
    return data;
  }
}