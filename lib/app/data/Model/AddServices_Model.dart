class AddServices_Model {
  int? code;
  List<DataServices>? data;
  String? message;

  AddServices_Model({this.code, this.data, this.message});

  AddServices_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataServices>[];
      json['data'].forEach((v) {
        data!.add(new DataServices.fromJson(v));
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

class DataServices {
  int? companyID;
  String? companyAName;
  String? companyEName;
  bool? ishasTax;
  String? address;
  String? itemTypeAName;
  String? itemTypeEName;
  String? unitAName;
  String? unitEName;
  String? itemAName;
  String? itemEName;
  int? itemID;
  String? itemDesc;
  bool? itemishasTax;
  List<ItemDetails>? itemDetails;
  String? registerDate;

  DataServices(
      {this.companyID,
      this.companyAName,
      this.companyEName,
      this.ishasTax,
      this.address,
      this.itemTypeAName,
      this.itemTypeEName,
      this.unitAName,
      this.unitEName,
      this.itemAName,
      this.itemEName,
      this.itemID,
      this.itemDesc,
      this.itemishasTax,
      this.itemDetails,
      this.registerDate});

  DataServices.fromJson(Map<String, dynamic> json) {
    companyID = json['companyID'];
    companyAName = json['companyAName'];
    companyEName = json['companyEName'];
    ishasTax = json['ishasTax'];
    address = json['address'];
    itemTypeAName = json['itemTypeAName'];
    itemTypeEName = json['itemTypeEName'];
    unitAName = json['unitAName'];
    unitEName = json['unitEName'];
    itemAName = json['itemAName'];
    itemEName = json['itemEName'];
    itemID = json['itemID'];
    itemDesc = json['itemDesc'];
    itemishasTax = json['itemishasTax'];
    if (json['itemDetails'] != null) {
      itemDetails = <ItemDetails>[];
      json['itemDetails'].forEach((v) {
        itemDetails!.add(new ItemDetails.fromJson(v));
      });
    }
    registerDate = json['registerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['companyAName'] = this.companyAName;
    data['companyEName'] = this.companyEName;
    data['ishasTax'] = this.ishasTax;
    data['address'] = this.address;
    data['itemTypeAName'] = this.itemTypeAName;
    data['itemTypeEName'] = this.itemTypeEName;
    data['unitAName'] = this.unitAName;
    data['unitEName'] = this.unitEName;
    data['itemAName'] = this.itemAName;
    data['itemEName'] = this.itemEName;
    data['itemID'] = this.itemID;
    data['itemDesc'] = this.itemDesc;
    data['itemishasTax'] = this.itemishasTax;
    if (this.itemDetails != null) {
      data['itemDetails'] = this.itemDetails!.map((v) => v.toJson()).toList();
    }
    data['registerDate'] = this.registerDate;
    return data;
  }
}

class ItemDetails {
  int? itemPrice;
  int? itemCount;

  ItemDetails({this.itemPrice, this.itemCount});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    itemPrice = json['itemPrice'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemPrice'] = this.itemPrice;
    data['itemCount'] = this.itemCount;
    return data;
  }
}

