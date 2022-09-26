class units {
  int? code;
  List<DataUnits>? data;
  String? message;

  units({this.code, this.data, this.message});

  units.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataUnits>[];
      json['data'].forEach((v) {
        data!.add(new DataUnits.fromJson(v));
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

class DataUnits {
  int? unitID;
  String? unitAName;
  String? unitEName;

  DataUnits({this.unitID, this.unitAName, this.unitEName});

  DataUnits.fromJson(Map<String, dynamic> json) {
    unitID = json['unitID'];
    unitAName = json['unitAName'];
    unitEName = json['unitEName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unitID'] = this.unitID;
    data['unitAName'] = this.unitAName;
    data['unitEName'] = this.unitEName;
    return data;
  }
}