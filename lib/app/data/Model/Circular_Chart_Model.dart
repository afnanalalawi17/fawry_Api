class Circular_Chart_Model {
  int? code;
  List<DataCircular>? data;
  String? message;

  Circular_Chart_Model({this.code, this.data, this.message});

  Circular_Chart_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataCircular>[];
      json['data'].forEach((v) {
        data!.add(new DataCircular.fromJson(v));
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

class DataCircular {
  String? itemID;
  String? itemAName;
  num? totalAmount;

  DataCircular({this.itemID, this.itemAName, this.totalAmount});

  DataCircular.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    itemAName = json['itemAName'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['itemAName'] = this.itemAName;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}