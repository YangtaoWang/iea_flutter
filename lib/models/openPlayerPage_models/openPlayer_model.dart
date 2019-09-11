class OpenPlayerModle {
    int learnerCount;
    int openClassId;
    String openClassName;
    int playDuration;
    List<dynamic> recommendList;
    String videoCover;
    int videoId;
    String videoName;
    String videoUrl;

    OpenPlayerModle({
        this.learnerCount,
        this.openClassId,
        this.openClassName,
        this.playDuration,
        this.recommendList,
        this.videoCover,
        this.videoId,
        this.videoName,
        this.videoUrl,
    });

    factory OpenPlayerModle.fromJson(Map<String, dynamic> json) => OpenPlayerModle(
        learnerCount: json["learnerCount"],
        openClassId: json["openClassId"],
        openClassName: json["openClassName"],
        playDuration: json["playDuration"],
        recommendList: List<dynamic>.from(json["recommendList"].map((x) => x)),
        videoCover: json["videoCover"],
        videoId: json["videoId"],
        videoName: json["videoName"],
        videoUrl: json["videoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "learnerCount": learnerCount,
        "openClassId": openClassId,
        "openClassName": openClassName,
        "playDuration": playDuration,
        "recommendList": List<dynamic>.from(recommendList.map((x) => x)),
        "videoCover": videoCover,
        "videoId": videoId,
        "videoName": videoName,
        "videoUrl": videoUrl,
    };
}