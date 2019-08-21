class CourseExamDataModel {
    int type;
    Title title;
    List<Item> items;
    AnswerInfo answerInfo;

    CourseExamDataModel({
        this.type,
        this.title,
        this.items,
        this.answerInfo,
    });

    factory CourseExamDataModel.fromJson(Map<String, dynamic> json) => new CourseExamDataModel(
        type: json["type"],
        title: Title.fromJson(json["title"]),
        items: new List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        answerInfo: AnswerInfo.fromJson(json["answerInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "title": title.toJson(),
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
        "answerInfo": answerInfo.toJson(),
    };
}

class AnswerInfo {
    String yourText;
    String answerText;
    Exp exp;

    AnswerInfo({
        this.yourText,
        this.answerText,
        this.exp,
    });

    factory AnswerInfo.fromJson(Map<String, dynamic> json) => new AnswerInfo(
        yourText: json["yourText"],
        answerText: json["answerText"],
        exp: Exp.fromJson(json["exp"]),
    );

    Map<String, dynamic> toJson() => {
        "yourText": yourText,
        "answerText": answerText,
        "exp": exp.toJson(),
    };
}

class Exp {
    String text;
    String img;

    Exp({
        this.text,
        this.img,
    });

    factory Exp.fromJson(Map<String, dynamic> json) => new Exp(
        text: json["text"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "img": img,
    };
}

class Item {
    String info;
    bool isRight;
    bool isChoosed;

    Item({
        this.info,
        this.isRight,
        this.isChoosed
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        info: json["info"],
        isRight: json["isRight"],
        isChoosed: json["isChoosed"],  
    );

    Map<String, dynamic> toJson() => {
        "info": info,
        "isRight": isRight,
        "isChoosed": isChoosed
    };
}

class Title {
    int note;
    String text;
    String img;

    Title({
        this.note,
        this.text,
        this.img,
    });

    factory Title.fromJson(Map<String, dynamic> json) => new Title(
        note: json["note"],
        text: json["text"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "note": note,
        "text": text,
        "img": img,
    };
}