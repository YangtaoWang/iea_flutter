class IndexGoodCourseModel {
    int id;
    String bannerUrl;
    String goName;
    String price;
    String discountPrice;
    dynamic gdCover;
    dynamic pageUrl;
    dynamic h5Url;
    dynamic linkType;
    dynamic isDiscount;
    dynamic goId;

    IndexGoodCourseModel({
        this.id,
        this.bannerUrl,
        this.goName,
        this.price,
        this.discountPrice,
        this.gdCover,
        this.pageUrl,
        this.h5Url,
        this.linkType,
        this.isDiscount,
        this.goId,
    });

    factory IndexGoodCourseModel.fromJson(Map<String, dynamic> json) => new IndexGoodCourseModel(
        id: json["id"],
        bannerUrl: json["bannerUrl"],
        goName: json["goName"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        gdCover: json["gdCover"],
        pageUrl: json["pageUrl"],
        h5Url: json["h5Url"],
        linkType: json["linkType"],
        isDiscount: json["isDiscount"],
        goId: json["goId"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bannerUrl": bannerUrl,
        "goName": goName,
        "price": price,
        "discountPrice": discountPrice,
        "gdCover": gdCover,
        "pageUrl": pageUrl,
        "h5Url": h5Url,
        "linkType": linkType,
        "isDiscount": isDiscount,
        "goId": goId
    };
}
