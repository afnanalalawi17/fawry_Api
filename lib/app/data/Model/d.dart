class countries {
  int? code;
  List<DataCountries>? data;
  String? message;

  countries({this.code, this.data, this.message});

  countries.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataCountries>[];
      json['data'].forEach((v) {
        data!.add(new DataCountries.fromJson(v));
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

class DataCountries {
  int? countryID;
  String? countryAName;
  String? countryEName;
  List<Currencies>? currencies;

  DataCountries({this.countryID, this.countryAName, this.countryEName, this.currencies});

  DataCountries.fromJson(Map<String, dynamic> json) {
    countryID = json['countryID'];
    countryAName = json['countryAName'];
    countryEName = json['countryEName'];
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(new Currencies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryID'] = this.countryID;
    data['countryAName'] = this.countryAName;
    data['countryEName'] = this.countryEName;
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Currencies {
  int? currencyID;
  String? currencyAName;
  String? currencyEName;

  Currencies({this.currencyID, this.currencyAName, this.currencyEName});

  Currencies.fromJson(Map<String, dynamic> json) {
    currencyID = json['currencyID'];
    currencyAName = json['currencyAName'];
    currencyEName = json['currencyEName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencyID'] = this.currencyID;
    data['currencyAName'] = this.currencyAName;
    data['currencyEName'] = this.currencyEName;
    return data;
  }
}