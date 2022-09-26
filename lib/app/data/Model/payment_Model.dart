

import 'dart:convert';

Payment_Model PaymentFromJson(String str) => Payment_Model.fromJson(json.decode(str));

String userDataToJson(Payment_Model data) => json.encode(data.toJson());




class Payment_Model {
  int ?code;
  String? data;
  String? message;

  Payment_Model({this.code, this.data, this.message});

  Payment_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}