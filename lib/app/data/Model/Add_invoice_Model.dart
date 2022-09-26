

import 'dart:convert';

Add_Invoice_Model userAddInvoiceFromJson(String str) => Add_Invoice_Model.fromJson(json.decode(str));

String userDataToJson(Add_Invoice_Model data) => json.encode(data.toJson());

class Add_Invoice_Model {
  int? code;
  List<Data>? data;
  String? message;

  Add_Invoice_Model({this.code, this.data, this.message});

  Add_Invoice_Model.fromJson(Map<String, dynamic> json) {
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
  bool? ishasTax;
  String? address;
  String? taxNumber;
  String? activityLogo;
  int? invoiceID;
  bool? isPaid;
  int? totalAmount;
  String? discountTypeAName;
  String? discountTypeEName;
  int? discountValue;
  num? totalIncludingTax;
  String? registerDate;
  String? registerTime;
  List<InvoiceDetails>? invoiceDetails;

  Data(
      {this.companyID,
      this.companyAName,
      this.companyEName,
      this.ishasTax,
      this.address,
      this.taxNumber,
      this.activityLogo,
      this.invoiceID,
      this.isPaid,
      this.totalAmount,
      this.discountTypeAName,
      this.discountTypeEName,
      this.discountValue,
      this.totalIncludingTax,
      this.registerDate,
      this.registerTime,
      this.invoiceDetails});

  Data.fromJson(Map<String, dynamic> json) {
    companyID = json['companyID'];
    companyAName = json['companyAName'];
    companyEName = json['companyEName'];
    ishasTax = json['ishasTax'];
    address = json['address'];
    taxNumber = json['taxNumber'];
    activityLogo = json['activityLogo'];
    invoiceID = json['invoiceID'];
    isPaid = json['isPaid'];
    totalAmount = json['totalAmount'];
    discountTypeAName = json['discountTypeAName'];
    discountTypeEName = json['discountTypeEName'];
    discountValue = json['discountValue'];
    totalIncludingTax = json['totalIncludingTax'];
    registerDate = json['registerDate'];
    registerTime = json['registerTime'];
    if (json['invoiceDetails'] != null) {
      invoiceDetails = <InvoiceDetails>[];
      json['invoiceDetails'].forEach((v) {
        invoiceDetails!.add(new InvoiceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['companyAName'] = this.companyAName;
    data['companyEName'] = this.companyEName;
    data['ishasTax'] = this.ishasTax;
    data['address'] = this.address;
    data['taxNumber'] = this.taxNumber;
    data['activityLogo'] = this.activityLogo;
    data['invoiceID'] = this.invoiceID;
    data['isPaid'] = this.isPaid;
    data['totalAmount'] = this.totalAmount;
    data['discountTypeAName'] = this.discountTypeAName;
    data['discountTypeEName'] = this.discountTypeEName;
    data['discountValue'] = this.discountValue;
    data['totalIncludingTax'] = this.totalIncludingTax;
    data['registerDate'] = this.registerDate;
    data['registerTime'] = this.registerTime;
    if (this.invoiceDetails != null) {
      data['invoiceDetails'] =
          this.invoiceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceDetails {
  String? itemAName;
  String? itemEName;
  int? itemID;
  int? count;
  int? amount;
  int? invoiceID;
  String? itemDesc;

  InvoiceDetails(
      {this.itemAName,
      this.itemEName,
      this.itemID,
      this.count,
      this.amount,
      this.invoiceID,
      this.itemDesc});

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    itemAName = json['itemAName'];
    itemEName = json['itemEName'];
    itemID = json['itemID'];
    count = json['count'];
    amount = json['amount'];
    invoiceID = json['invoiceID'];
    itemDesc = json['itemDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemAName'] = this.itemAName;
    data['itemEName'] = this.itemEName;
    data['itemID'] = this.itemID;
    data['count'] = this.count;
    data['amount'] = this.amount;
    data['invoiceID'] = this.invoiceID;
    data['itemDesc'] = this.itemDesc;
    return data;
  }
}

