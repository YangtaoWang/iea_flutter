class GoodDetailModle {
    int bottomStatus;
    String courseContent;
    List<CourseModuleList> courseModuleList;
    String cover;
    DateTime discountEndTime;
    dynamic discountPrice;
    dynamic discountStartTime;
    int goodsId;
    int learnerCount;
    int lessonCount;
    String name;
    int openLessonIndex;
    int openModuleIndex;
    double price;
    int serviceDays;
    dynamic serviceEndTime;
    dynamic serviceStartTime;
    int status;

    GoodDetailModle({
        this.bottomStatus,
        this.courseContent,
        this.courseModuleList,
        this.cover,
        this.discountEndTime,
        this.discountPrice,
        this.discountStartTime,
        this.goodsId,
        this.learnerCount,
        this.lessonCount,
        this.name,
        this.openLessonIndex,
        this.openModuleIndex,
        this.price,
        this.serviceDays,
        this.serviceEndTime,
        this.serviceStartTime,
        this.status,
    });

    factory GoodDetailModle.fromJson(Map<String, dynamic> json) => new GoodDetailModle(
        bottomStatus: json["bottomStatus"],
        courseContent: json["courseContent"],
        courseModuleList: new List<CourseModuleList>.from(json["courseModuleList"].map((x) => CourseModuleList.fromJson(x))),
        cover: json["cover"],
        discountEndTime: json["discountPrice"],
        discountPrice: json["discountPrice"],
        discountStartTime: json["discountStartTime"],
        goodsId: json["goodsId"],
        learnerCount: json["learnerCount"],
        lessonCount: json["lessonCount"],
        name: json["name"],
        openLessonIndex: json["openLessonIndex"],
        openModuleIndex: json["openModuleIndex"],
        price: json["price"],
        serviceDays: json["serviceDays"],
        serviceEndTime: json["serviceEndTime"],
        serviceStartTime: json["serviceStartTime"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "bottomStatus": bottomStatus,
        "courseContent": courseContent,
        "courseModuleList": new List<dynamic>.from(courseModuleList.map((x) => x.toJson())),
        "cover": cover,
        "discountEndTime": discountEndTime.toIso8601String(),
        "discountPrice": discountPrice,
        "discountStartTime": discountStartTime,
        "goodsId": goodsId,
        "learnerCount": learnerCount,
        "lessonCount": lessonCount,
        "name": name,
        "openLessonIndex": openLessonIndex,
        "openModuleIndex": openModuleIndex,
        "price": price,
        "serviceDays": serviceDays,
        "serviceEndTime": serviceEndTime,
        "serviceStartTime": serviceStartTime,
        "status": status,
    };
}

class CourseModuleList {
    List<LessonList> lessonList;
    int moduleId;
    String moduleName;

    CourseModuleList({
        this.lessonList,
        this.moduleId,
        this.moduleName,
    });

    factory CourseModuleList.fromJson(Map<String, dynamic> json) => new CourseModuleList(
        lessonList: new List<LessonList>.from(json["lessonList"].map((x) => LessonList.fromJson(x))),
        moduleId: json["moduleId"],
        moduleName: json["moduleName"],
    );

    Map<String, dynamic> toJson() => {
        "lessonList": new List<dynamic>.from(lessonList.map((x) => x.toJson())),
        "moduleId": moduleId,
        "moduleName": moduleName,
    };
}

class LessonList {
    String courseName;
    int isFree;
    int isWatch;
    int learnRate;
    int lessonId;
    int lessonType;
    int moduleLessonId;
    dynamic playBackAppUrl;
    String playBackH5Url;
    String playBackPcUrl;
    String playBackUrl;
    String teacherAvatarUrl;
    String teacherName;
    int videoId;
    String videoName;
    int videoSource;
    dynamic watching;

    LessonList({
        this.courseName,
        this.isFree,
        this.isWatch,
        this.learnRate,
        this.lessonId,
        this.lessonType,
        this.moduleLessonId,
        this.playBackAppUrl,
        this.playBackH5Url,
        this.playBackPcUrl,
        this.playBackUrl,
        this.teacherAvatarUrl,
        this.teacherName,
        this.videoId,
        this.videoName,
        this.videoSource,
        this.watching,
    });

    factory LessonList.fromJson(Map<String, dynamic> json) => new LessonList(
        courseName: json["courseName"],
        isFree: json["isFree"],
        isWatch: json["isWatch"],
        learnRate: json["learnRate"],
        lessonId: json["lessonId"],
        lessonType: json["lessonType"],
        moduleLessonId: json["moduleLessonId"],
        playBackAppUrl: json["playBackAppUrl"],
        playBackH5Url: json["playBackH5Url"] == null ? null : json["playBackH5Url"],
        playBackPcUrl: json["playBackPcUrl"] == null ? null : json["playBackPcUrl"],
        playBackUrl: json["playBackUrl"] == null ? null : json["playBackUrl"],
        teacherAvatarUrl: json["teacherAvatarUrl"] == null ? null : json["teacherAvatarUrl"],
        teacherName: json["teacherName"] == null ? null : json["teacherName"],
        videoId: json["videoId"] == null ? null : json["videoId"],
        videoName: json["videoName"] == null ? null : json["videoName"],
        videoSource: json["videoSource"] == null ? null : json["videoSource"],
        watching: json["watching"],
    );

    Map<String, dynamic> toJson() => {
        "courseName": courseName,
        "isFree": isFree,
        "isWatch": isWatch,
        "learnRate": learnRate,
        "lessonId": lessonId,
        "lessonType": lessonType,
        "moduleLessonId": moduleLessonId,
        "playBackAppUrl": playBackAppUrl,
        "playBackH5Url": playBackH5Url == null ? null : playBackH5Url,
        "playBackPcUrl": playBackPcUrl == null ? null : playBackPcUrl,
        "playBackUrl": playBackUrl == null ? null : playBackUrl,
        "teacherAvatarUrl": teacherAvatarUrl == null ? null : teacherAvatarUrl,
        "teacherName": teacherName == null ? null : teacherName,
        "videoId": videoId == null ? null : videoId,
        "videoName": videoName == null ? null : videoName,
        "videoSource": videoSource == null ? null : videoSource,
        "watching": watching,
    };
}