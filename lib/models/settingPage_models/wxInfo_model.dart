class WxInfo {
    String name;
    String wechatPic;
    String wechatNo;

    WxInfo({
        this.name,
        this.wechatPic,
        this.wechatNo,
    });

    factory WxInfo.fromJson(Map<String, dynamic> json) => new WxInfo(
        name: json["name"],
        wechatPic: json["wechatPic"],
        wechatNo: json["wechatNo"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "wechatPic": wechatPic,
        "wechatNo": wechatNo,
    };
}