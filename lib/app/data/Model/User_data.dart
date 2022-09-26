
import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());
class UserData {
  int ?code;
  Data? data;
  String? message;

  UserData({this.code, this.data, this.message});

  UserData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String ?email;
  String? firstName;
  String ?lastName;
  String ?mobileNo;
  bool ?mobileNoConfirmed;
  String? roleName;

  Data(
      {this.email,
      this.firstName,
      this.lastName,
      this.mobileNo,
      this.mobileNoConfirmed,
      this.roleName});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobileNo'];
    mobileNoConfirmed = json['mobileNoConfirmed'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobileNo'] = this.mobileNo;
    data['mobileNoConfirmed'] = this.mobileNoConfirmed;
    data['roleName'] = this.roleName;
    return data;
  }
}