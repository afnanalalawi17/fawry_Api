class invoice_purchase_history_Model {
  int? code;
  List<Data>? data;
  String? message;

  invoice_purchase_history_Model({this.code, this.data, this.message});

  invoice_purchase_history_Model.fromJson(Map<String, dynamic> json) {
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
  int? purchaseID;
  int? companyID;
  String? companyAName;
  String? companyEName;
  int? purchaseTypeID;
  String? purchaseTypeAName;
  String? purchaseTypeEName;
  String? taxValue;
  bool? ishasTax;
  String? address;
  int? totalAmount;
  int? totalIncludingTax;
  String? registerDate;
  String? desc;
  List<Supplier>? supplier;
  List<ItemHistory>? itemHistory;

  Data(
      {this.purchaseID,
      this.companyID,
      this.companyAName,
      this.companyEName,
      this.purchaseTypeID,
      this.purchaseTypeAName,
      this.purchaseTypeEName,
      this.taxValue,
      this.ishasTax,
      this.address,
      this.totalAmount,
      this.totalIncludingTax,
      this.registerDate,
      this.desc,
      this.supplier,
      this.itemHistory});

  Data.fromJson(Map<String, dynamic> json) {
    purchaseID = json['purchaseID'];
    companyID = json['companyID'];
    companyAName = json['companyAName'];
    companyEName = json['companyEName'];
    purchaseTypeID = json['purchaseTypeID'];
    purchaseTypeAName = json['purchaseTypeAName'];
    purchaseTypeEName = json['purchaseTypeEName'];
    taxValue = json['taxValue'];
    ishasTax = json['ishasTax'];
    address = json['address'];
    totalAmount = json['totalAmount'];
    totalIncludingTax = json['totalIncludingTax'];
    registerDate = json['registerDate'];
    desc = json['desc'];
    if (json['supplier'] != null) {
      supplier = <Supplier>[];
      json['supplier'].forEach((v) {
        supplier!.add(new Supplier.fromJson(v));
      });
    }
    if (json['itemHistory'] != null) {
      itemHistory = <ItemHistory>[];
      json['itemHistory'].forEach((v) {
        itemHistory!.add(new ItemHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchaseID'] = this.purchaseID;
    data['companyID'] = this.companyID;
    data['companyAName'] = this.companyAName;
    data['companyEName'] = this.companyEName;
    data['purchaseTypeID'] = this.purchaseTypeID;
    data['purchaseTypeAName'] = this.purchaseTypeAName;
    data['purchaseTypeEName'] = this.purchaseTypeEName;
    data['taxValue'] = this.taxValue;
    data['ishasTax'] = this.ishasTax;
    data['address'] = this.address;
    data['totalAmount'] = this.totalAmount;
    data['totalIncludingTax'] = this.totalIncludingTax;
    data['registerDate'] = this.registerDate;
    data['desc'] = this.desc;
    if (this.supplier != null) {
      data['supplier'] = this.supplier!.map((v) => v.toJson()).toList();
    }
    if (this.itemHistory != null) {
      data['itemHistory'] = this.itemHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Supplier {
  String? supplierAName;
  String? supplierEName;
  String? address;
  String? phoneNumber;
  String? commercialRecordNo;

  Supplier(
      {this.supplierAName,
      this.supplierEName,
      this.address,
      this.phoneNumber,
      this.commercialRecordNo});

  Supplier.fromJson(Map<String, dynamic> json) {
    supplierAName = json['supplierAName'];
    supplierEName = json['supplierEName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    commercialRecordNo = json['commercialRecordNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplierAName'] = this.supplierAName;
    data['supplierEName'] = this.supplierEName;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['commercialRecordNo'] = this.commercialRecordNo;
    return data;
  }
}

class ItemHistory {
  int? itemHistoryID;
  String? itemTypeAName;
  String? itemTypeEName;
  String? unitAName;
  String? unitEName;
  String? itemAName;
  String? itemEName;
  int? itemID;
  String? itemDesc;
  int? itemPrice;
  int? totalAmount;
  int? totalIncludingTax;
  int? purchasePrice;
  bool? itemishasTax;
  int? itemCount;
  int? fullCount;
  String? registerDate;

  ItemHistory(
      {this.itemHistoryID,
      this.itemTypeAName,
      this.itemTypeEName,
      this.unitAName,
      this.unitEName,
      this.itemAName,
      this.itemEName,
      this.itemID,
      this.itemDesc,
      this.itemPrice,
      this.totalAmount,
      this.totalIncludingTax,
      this.purchasePrice,
      this.itemishasTax,
      this.itemCount,
      this.fullCount,
      this.registerDate});

  ItemHistory.fromJson(Map<String, dynamic> json) {
    itemHistoryID = json['itemHistoryID'];
    itemTypeAName = json['itemTypeAName'];
    itemTypeEName = json['itemTypeEName'];
    unitAName = json['unitAName'];
    unitEName = json['unitEName'];
    itemAName = json['itemAName'];
    itemEName = json['itemEName'];
    itemID = json['itemID'];
    itemDesc = json['itemDesc'];
    itemPrice = json['itemPrice'];
    totalAmount = json['totalAmount'];
    totalIncludingTax = json['totalIncludingTax'];
    purchasePrice = json['purchasePrice'];
    itemishasTax = json['itemishasTax'];
    itemCount = json['itemCount'];
    fullCount = json['fullCount'];
    registerDate = json['registerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemHistoryID'] = this.itemHistoryID;
    data['itemTypeAName'] = this.itemTypeAName;
    data['itemTypeEName'] = this.itemTypeEName;
    data['unitAName'] = this.unitAName;
    data['unitEName'] = this.unitEName;
    data['itemAName'] = this.itemAName;
    data['itemEName'] = this.itemEName;
    data['itemID'] = this.itemID;
    data['itemDesc'] = this.itemDesc;
    data['itemPrice'] = this.itemPrice;
    data['totalAmount'] = this.totalAmount;
    data['totalIncludingTax'] = this.totalIncludingTax;
    data['purchasePrice'] = this.purchasePrice;
    data['itemishasTax'] = this.itemishasTax;
    data['itemCount'] = this.itemCount;
    data['fullCount'] = this.fullCount;
    data['registerDate'] = this.registerDate;
    return data;
  }
}