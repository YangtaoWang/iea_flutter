// To parse this JSON data, do
//
//     final mineCourseModel = mineCourseModelFromJson(jsonString);

class MineCourseModel {
    List<PurchasedCourse> purchasedCourses;

    MineCourseModel({
        this.purchasedCourses,
    });

    factory MineCourseModel.fromJson(Map<String, dynamic> json) => new MineCourseModel(
        purchasedCourses: new List<PurchasedCourse>.from(json["purchasedCourses"].map((x) => PurchasedCourse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "purchasedCourses": new List<dynamic>.from(purchasedCourses.map((x) => x.toJson())),
    };
}

class PurchasedCourse {
    int id;
    String ocName;
    String ocCover;
    String tname;
    String avatarUrl;
    String proName;
    String gdCover;
    String goName;
    String lessionCount;
    int isCourse;

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
    });

    factory PurchasedCourse.fromJson(Map<String, dynamic> json) => new PurchasedCourse(
        id: json["id"],
        ocName: json["ocName"] == null ? null : json["ocName"],
        ocCover: json["ocCover"] == null ? null : json["ocCover"],
        tname: json["tname"] == null ? null : json["tname"],
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
        proName: json["proName"] == null ? null : json["proName"],
        gdCover: json["gdCover"] == null ? null : json["gdCover"],
        goName: json["goName"] == null ? null : json["goName"],
        lessionCount: json["lessionCount"] == null ? null : json["lessionCount"],
        isCourse: json["isCourse"],
    );
    // String textlimt(String key, int size) {
    //   // if(key==null) return null;
    //   if(key.length>size) {
    //     return key.substring(0,size) + '...';
    //   }
    // }
    Map<String, dynamic> toJson() => {
        "id": id,
        "ocName": ocName == null ? null : ocName,
        "ocCover": ocCover == null ? null : ocCover,
        "tname": tname == null ? null : tname,
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
        "proName": proName == null ? null : proName,
        "gdCover": gdCover == null ? null : gdCover,
        // "goName": goName == null ? null : goName,
        "goName": goName == null ? null : goName.substring(0,3),
        "lessionCount": lessionCount == null ? null : lessionCount,
        "isCourse": isCourse,
    };

}