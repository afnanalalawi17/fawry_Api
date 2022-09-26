class Supplier_Model {
  int? code;
  List<DataSupplier>? data;
  String? message;

  Supplier_Model({this.code, this.data, this.message});

  Supplier_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataSupplier>[];
      json['data'].forEach((v) {
        data!.add(new DataSupplier.fromJson(v));
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

class DataSupplier {
  int? supplierID;
  String? supplierAName;
  String? supplierEName;
  String? address;
  String? phoneNumber;
  String? commercialRecordNo;

  DataSupplier(
      {this.supplierID,
      this.supplierAName,
      this.supplierEName,
      this.address,
      this.phoneNumber,
      this.commercialRecordNo});

  DataSupplier.fromJson(Map<String, dynamic> json) {
    supplierID = json['supplierID'];
    supplierAName = json['supplierAName'];
    supplierEName = json['supplierEName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    commercialRecordNo = json['commercialRecordNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplierID'] = this.supplierID;
    data['supplierAName'] = this.supplierAName;
    data['supplierEName'] = this.supplierEName;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['commercialRecordNo'] = this.commercialRecordNo;
    return data;
  }
}