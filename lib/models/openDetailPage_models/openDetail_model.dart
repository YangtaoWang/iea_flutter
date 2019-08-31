class OpenDetailModel {
    int openClassId;
    String cover;
    String name;
    double price;
    int learnerCount;
    String teacherAvatarUrl;
    int videoId;
    String teacherName;
    String teacherIntroduce;
    String courseContent;
    int lessonType;
    int bottomStatus;
    int status;

    OpenDetailModel({
        this.openClassId,
        this.cover,
        this.name,
        this.price,
        this.learnerCount,
        this.teacherAvatarUrl,
        this.videoId,
        this.teacherName,
        this.teacherIntroduce,
        this.courseContent,
        this.lessonType,
        this.bottomStatus,
        this.status,
    });

    factory OpenDetailModel.fromJson(Map<String, dynamic> json) => new OpenDetailModel(
        openClassId: json["openClassId"],
        cover: json["cover"],
        name: json["name"],
        price: json["price"].toDouble(),
        learnerCount: json["learnerCount"],
        teacherAvatarUrl: json["teacherAvatarUrl"],
        videoId: json["videoId"],
        teacherName: json["teacherName"],
        teacherIntroduce: json["teacherIntroduce"],
        courseContent: json["courseContent"],
        lessonType: json["lessonType"],
        bottomStatus: json["bottomStatus"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "openClassId": openClassId,
        "cover": cover,
        "name": name,
        "price": price,
        "learnerCount": learnerCount,
        "teacherAvatarUrl": teacherAvatarUrl,
        "videoId": videoId,
        "teacherName": teacherName,
        "teacherIntroduce": teacherIntroduce,
        "courseContent": courseContent,
        "lessonType": lessonType,
        "bottomStatus": bottomStatus,
        "status": status,
    };
}