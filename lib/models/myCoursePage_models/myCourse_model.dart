class MyCourseModel {
    int id;
    dynamic ocName;
    dynamic ocCover;
    dynamic tname;
    dynamic avatarUrl;
    String proName;
    String gdCover;
    String goName;
    String lessionCount;
    int isCourse;
    String coId;
    String goId;
    String serviceStartTime;
    String serviceEndTime;

    MyCourseModel({
        this.id,
        this.ocName,
        this.ocCover,
        this.tname,
        this.avatarUrl,
        this.proName,
        this.gdCover,
        this.goName,
        this.lessionCount,
        this.isCourse,
        this.coId,
        this.goId,
        this.serviceStartTime,
        this.serviceEndTime,
    });

    factory MyCourseModel.fromJson(Map<String, dynamic> json) => new MyCourseModel(
        id: json["id"],
        ocName: json["ocName"],
        ocCover: json["ocCover"],
        tname: json["tname"],
        avatarUrl: json["avatarUrl"],
        proName: json["proName"],
        gdCover: json["gdCover"],
        goName: json["goName"],
        lessionCount: json["lessionCount"],
        isCourse: json["isCourse"],
        coId: json["coId"],
        goId: json["goId"],
        serviceStartTime: json["serviceStartTime"],
        serviceEndTime: json["serviceEndTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ocName": ocName,
        "ocCover": ocCover,
        "tname": tname,
        "avatarUrl": avatarUrl,
        "proName": proName,
        "gdCover": gdCover,
        "goName": goName,
        "lessionCount": lessionCount,
        "isCourse": isCourse,
        "coId": coId,
        "goId": goId,
        "serviceStartTime": serviceStartTime,
        "serviceEndTime": serviceEndTime,
    };
}