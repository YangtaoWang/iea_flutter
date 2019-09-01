class MyCourseModel {
    List<PurchasedCourse> purchasedCourses;

    MyCourseModel({
        this.purchasedCourses,
    });

    factory MyCourseModel.fromJson(Map<String, dynamic> json) => new MyCourseModel(
        purchasedCourses: new List<PurchasedCourse>.from(json["purchasedCourses"].map((x) => PurchasedCourse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "purchasedCourses": new List<dynamic>.from(purchasedCourses.map((x) => x.toJson())),
    };
}

class PurchasedCourse {
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
    String goId;
    String coId;
    String serviceStartTime;
    String serviceEndTime;
    String cover;

    PurchasedCourse({
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
        this.goId,
        this.coId,
        this.serviceStartTime,
        this.serviceEndTime,
        this.cover,
    });

    factory PurchasedCourse.fromJson(Map<String, dynamic> json) => new PurchasedCourse(
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
        goId: json["goId"],
        coId: json["coId"],
        serviceStartTime: json["serviceStartTime"],
        serviceEndTime: json["serviceEndTime"],
        cover: json["cover"],
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
        "goId": goId,
        "coId": coId,
        "serviceStartTime": serviceStartTime,
        "serviceEndTime": serviceEndTime,
        "cover": cover,
    };
}