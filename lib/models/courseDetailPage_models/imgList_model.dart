// import 'dart:convert' show json;

// class ImgListDataModel {
//   String id;
//   String remarks;
//   String createDate;
//   String delFlag;
//   String bannerImg;
//   String bannerHref;
//   String classId;


//   ImgListDataModel.fromParams({this.id, this.remarks, this.createDate, this.delFlag, this.bannerImg, this.bannerHref, this.classId});

//   factory ImgListDataModel(jsonStr) => jsonStr == null
//       ? null
//       : jsonStr is String
//           ? new ImgListDataModel.fromJson(json.decode(jsonStr))
//           : new ImgListDataModel.fromJson(jsonStr);

//   ImgListDataModel.fromJson(jsonRes) {
//     id = jsonRes['id'];
//     remarks = jsonRes['remarks'];
//     createDate = jsonRes['createDate'];
//     delFlag = jsonRes['delFlag'];
//     bannerImg = jsonRes['bannerImg'];
//     bannerHref = jsonRes['bannerHref'];
//     classId = jsonRes['classId'];
//   }

//   @override
//   String toString() {
//     return '{"id": ${id != null ? '${json.encode(id)}' : 'null'}, "remarks": ${remarks != null ? '${json.encode(remarks)}' : 'null'}}}, {"createDate": ${createDate != null ? '${json.encode(createDate)}' : 'null'}, {"delFlag": ${delFlag != null ? '${json.encode(delFlag)}' : 'null'}, {"bannerImg": ${bannerImg != null ? '${json.encode(bannerImg)}' : 'null'},{"bannerHref": ${bannerHref != null ? '${json.encode(bannerHref)}' : 'null'},{"classId": ${classId != null ? '${json.encode(classId)}' : 'null'}';
//   }
// }


// To parse this JSON data, do
//
//     final imgListData = imgListDataFromJson(jsonString);

// import 'dart:convert';

class ImgListDataModel {
    String id;
    String remarks;
    DateTime createDate;
    String delFlag;
    String bannerImg;
    String bannerHref;
    String classId;

    ImgListDataModel({
        this.id,
        this.remarks,
        this.createDate,
        this.delFlag,
        this.bannerImg,
        this.bannerHref,
        this.classId,
    });

    factory ImgListDataModel.fromJson(Map<String, dynamic> json) => new ImgListDataModel(
        id: json["id"],
        remarks: json["remarks"],
        createDate: DateTime.parse(json["createDate"]),
        delFlag: json["delFlag"],
        bannerImg: json["bannerImg"],
        bannerHref: json["bannerHref"],
        classId: json["classId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "remarks": remarks,
        "createDate": createDate.toIso8601String(),
        "delFlag": delFlag,
        "bannerImg": bannerImg,
        "bannerHref": bannerHref,
        "classId": classId,
    };
}
