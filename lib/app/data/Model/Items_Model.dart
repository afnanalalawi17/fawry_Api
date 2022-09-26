class Items_Model {
  int? code;
  List<DataItems>? data;
  String? message;

  Items_Model({this.code, this.data, this.message});

  Items_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataItems>[];
      json['data'].forEach((v) {
        data!.add(new DataItems.fromJson(v));
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

class DataItems {
  int? itemTypeID;
  int? companyID;
  String? companyAName;
  String? companyEName;
  String? itemTypeAName;
  String? itemTypeEName;

  DataItems(
      {this.itemTypeID,
      this.companyID,
      this.companyAName,
      this.companyEName,
      this.itemTypeAName,
      this.itemTypeEName});

  DataItems.fromJson(Map<String, dynamic> json) {
    itemTypeID = json['itemTypeID'];
    companyID = json['companyID'];
    companyAName = json['companyAName'];
    companyEName = json['companyEName'];
    itemTypeAName = json['itemTypeAName'];
    itemTypeEName = json['itemTypeEName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemTypeID'] = this.itemTypeID;
    data['companyID'] = this.companyID;
    data['companyAName'] = this.companyAName;
    data['companyEName'] = this.companyEName;
    data['itemTypeAName'] = this.itemTypeAName;
    data['itemTypeEName'] = this.itemTypeEName;
    return data;
  }
}