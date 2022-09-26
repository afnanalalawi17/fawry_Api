class Ads_Model {
  int? code;
  List<Data>? data;
  String? message;

  Ads_Model({this.code, this.data, this.message});

  Ads_Model.fromJson(Map<String, dynamic> json) {
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
  int? advertisementsID;
  String? advertisementAName;
  String? advertisementEName;
  String? advertisementcontent;
  String? expireDate;
  bool? isActive;
  List<AdsImages>? adsImages;
  String? registerDate;

  Data(
      {this.advertisementsID,
      this.advertisementAName,
      this.advertisementEName,
      this.advertisementcontent,
      this.expireDate,
      this.isActive,
      this.adsImages,
      this.registerDate});

  Data.fromJson(Map<String, dynamic> json) {
    advertisementsID = json['advertisementsID'];
    advertisementAName = json['advertisementAName'];
    advertisementEName = json['advertisementEName'];
    advertisementcontent = json['advertisementcontent'];
    expireDate = json['expireDate'];
    isActive = json['isActive'];
    if (json['adsImages'] != null) {
      adsImages = <AdsImages>[];
      json['adsImages'].forEach((v) {
        adsImages!.add(new AdsImages.fromJson(v));
      });
    }
    registerDate = json['registerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['advertisementsID'] = this.advertisementsID;
    data['advertisementAName'] = this.advertisementAName;
    data['advertisementEName'] = this.advertisementEName;
    data['advertisementcontent'] = this.advertisementcontent;
    data['expireDate'] = this.expireDate;
    data['isActive'] = this.isActive;
    if (this.adsImages != null) {
      data['adsImages'] = this.adsImages!.map((v) => v.toJson()).toList();
    }
    data['registerDate'] = this.registerDate;
    return data;
  }
}

class AdsImages {
  int? adsImagesID;
  String? path;

  AdsImages({this.adsImagesID, this.path});

  AdsImages.fromJson(Map<String, dynamic> json) {
    adsImagesID = json['adsImagesID'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adsImagesID'] = this.adsImagesID;
    data['path'] = this.path;
    return data;
  }
}

