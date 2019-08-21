class IndexOpenCourseModel {
    int id;
    dynamic createTime;
    dynamic updateTime;
    dynamic createBy;
    dynamic updateBy;
    dynamic type;
    String picture;
    int linkType;
    String linkUrl;
    String router;
    dynamic sort;
    dynamic delFlag;
    dynamic status;

    IndexOpenCourseModel({
        this.id,
        this.createTime,
        this.updateTime,
        this.createBy,
        this.updateBy,
        this.type,
        this.picture,
        this.linkType,
        this.linkUrl,
        this.router,
        this.sort,
        this.delFlag,
        this.status,
    });

    factory IndexOpenCourseModel.fromJson(Map<String, dynamic> json) => new IndexOpenCourseModel(
        id: json["id"],
        createTime: json["createTime"],
        updateTime: json["updateTime"],
        createBy: json["createBy"],
        updateBy: json["updateBy"],
        type: json["type"],
        picture: json["picture"],
        linkType: json["linkType"],
        linkUrl: json["linkUrl"],
        router: json["router"],
        sort: json["sort"],
        delFlag: json["delFlag"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime,
        "updateTime": updateTime,
        "createBy": createBy,
        "updateBy": updateBy,
        "type": type,
        "picture": picture,
        "linkType": linkType,
        "linkUrl": linkUrl,
        "router": router,
        "sort": sort,
        "delFlag": delFlag,
        "status": status,
    };
}