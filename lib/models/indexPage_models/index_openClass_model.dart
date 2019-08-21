class IndexOpenClassModel {
    int id;
    int sort;
    int openClassId;
    String openClassName;
    String learnerCount;
    dynamic bannerUrl;

    IndexOpenClassModel({
        this.id,
        this.sort,
        this.openClassId,
        this.openClassName,
        this.learnerCount,
        this.bannerUrl,
    });

    factory IndexOpenClassModel.fromJson(Map<String, dynamic> json) => new IndexOpenClassModel(
        id: json["id"],
        sort: json["sort"],
        openClassId: json["openClassId"],
        openClassName: json["openClassName"],
        learnerCount: json["learnerCount"],
        bannerUrl: json["bannerUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sort": sort,
        "openClassId": openClassId,
        "openClassName": openClassName,
        "learnerCount": learnerCount,
        "bannerUrl": bannerUrl,
    };
}