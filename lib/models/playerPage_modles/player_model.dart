class PlayerModle {
    int moduleLessonId;
    int videoId;
    String videoCover;
    String videoUrl;
    String videoName;
    int playDuration;
    int homeWorkStatus;
    dynamic teacherName;
    String avatarUrl;
    dynamic introduceUrl;
    String introduce;

    PlayerModle({
        this.moduleLessonId,
        this.videoId,
        this.videoCover,
        this.videoUrl,
        this.videoName,
        this.playDuration,
        this.homeWorkStatus,
        this.teacherName,
        this.avatarUrl,
        this.introduceUrl,
        this.introduce,
    });

    factory PlayerModle.fromJson(Map<String, dynamic> json) => PlayerModle(
        moduleLessonId: json["moduleLessonId"],
        videoId: json["videoId"],
        videoCover: json["videoCover"],
        videoUrl: json["videoUrl"],
        videoName: json["videoName"],
        playDuration: json["playDuration"],
        homeWorkStatus: json["homeWorkStatus"],
        teacherName: json["teacherName"],
        avatarUrl: json["avatarUrl"],
        introduceUrl: json["introduceUrl"],
        introduce: json["introduce"],
    );

    Map<String, dynamic> toJson() => {
        "moduleLessonId": moduleLessonId,
        "videoId": videoId,
        "videoCover": videoCover,
        "videoUrl": videoUrl,
        "videoName": videoName,
        "playDuration": playDuration,
        "homeWorkStatus": homeWorkStatus,
        "teacherName": teacherName,
        "avatarUrl": avatarUrl,
        "introduceUrl": introduceUrl,
        "introduce": introduce,
    };
}