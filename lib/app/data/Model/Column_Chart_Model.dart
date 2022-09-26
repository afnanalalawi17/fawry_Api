class Column_Chart_Model {
  int? code;
  List<DataColumnChart>? data;
  String? message;

  Column_Chart_Model({this.code, this.data, this.message});

  Column_Chart_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataColumnChart>[];
      json['data'].forEach((v) {
        data!.add(new DataColumnChart.fromJson(v));
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

class DataColumnChart {
  String? montHs;
  String? invoiceCount;
  String? totalAmount;

  DataColumnChart({this.montHs, this.invoiceCount, this.totalAmount});

  DataColumnChart.fromJson(Map<String, dynamic> json) {
    montHs = json['montHs'];
    invoiceCount = json['invoiceCount'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['montHs'] = this.montHs;
    data['invoiceCount'] = this.invoiceCount;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}