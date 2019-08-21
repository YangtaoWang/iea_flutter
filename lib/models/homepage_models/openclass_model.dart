// import 'dart:convert' show json;

class OpenClassModel {
  String mainImg;
  List<InfoList> infoList;

  OpenClassModel({this.mainImg, this.infoList});

  OpenClassModel.fromJson(Map<String, dynamic> json) {
    mainImg = json['mainImg'];
    if (json['infoList'] != null) {
      infoList = new List<InfoList>();
      json['infoList'].forEach((v) {
        infoList.add(new InfoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mainImg'] = this.mainImg;
    if (this.infoList != null) {
      data['infoList'] = this.infoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InfoList {
  String openClassId;
  String cover;
  double price;
  String className;
  bool isOpenCourse;

  InfoList(
      {this.openClassId,
      this.cover,
      this.price,
      this.className,
      this.isOpenCourse});

  InfoList.fromJson(Map<String, dynamic> json) {
    // openClassId = json['openClassId'];
    // cover = json['cover'];
    // price = json['price'];
    // className = json['className'];
    // isOpenCourse = json['isOpenCourse'];

    openClassId = json['openClassId'] != null ? json['openClassId'] : 'null';
    cover = json['cover'] != null ? json['cover'] : 'null';
    price = json['price'] != null ? json['price'] : 'null';
    className = json['className'] != null ? json['className'] : 'null';
    isOpenCourse = json['isOpenCourse'] != null ? json['isOpenCourse'] : 'null';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['openClassId'] = this.openClassId;
    // data['cover'] = this.cover;
    // data['price'] = this.price;
    // data['className'] = this.className;
    // data['isOpenCourse'] = this.isOpenCourse;

    data['openClassId'] = this.openClassId != null ? this.openClassId : 'null';
    data['cover'] = this.cover != null ? this.cover : 'null';
    data['price'] = this.price != null ? this.price : 'null';
    data['className'] = this.className != null ? this.className : 'null';
    data['isOpenCourse'] =
        this.isOpenCourse != null ? this.isOpenCourse : 'null';
    return data;
  }
}
