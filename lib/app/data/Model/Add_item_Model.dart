class Add_Item_Model {
  int? code;
  List<Data>? data;
  String? message;

  Add_Item_Model({this.code, this.data, this.message});

  Add_Item_Model.fromJson(Map<String, dynamic> json) {
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
  int? itemTypeID;
  int? companyID;
  String? companyAName;
  String? companyEName;
  String? itemTypeAName;
  String? itemTypeEName;

  Data(
      {this.itemTypeID,
      this.companyID,
      this.companyAName,
      this.companyEName,
      this.itemTypeAName,
      this.itemTypeEName});

  Data.fromJson(Map<String, dynamic> json) {
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