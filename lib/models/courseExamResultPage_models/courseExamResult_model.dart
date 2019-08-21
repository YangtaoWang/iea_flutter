class ExamResultDataModel {
    int sumNote;
    int getNote;
    int resultType;
    String time;
    int right;
    int sumExam;
    List<ResultList> resultList;

    ExamResultDataModel({
        this.sumNote,
        this.getNote,
        this.resultType,
        this.time,
        this.right,
        this.sumExam,
        this.resultList,
    });

    factory ExamResultDataModel.fromJson(Map<String, dynamic> json) => new ExamResultDataModel(
        sumNote: json["sumNote"],
        getNote: json["getNote"],
        resultType: json["resultType"],
        time: json["time"],
        right: json["right"],
        sumExam: json["sumExam"],
        resultList: new List<ResultList>.from(json["resultList"].map((x) => ResultList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sumNote": sumNote,
        "getNote": getNote,
        "resultType": resultType,
        "time": time,
        "right": right,
        "sumExam": sumExam,
        "resultList": new List<dynamic>.from(resultList.map((x) => x.toJson())),
    };
}

class ResultList {
    bool isRight;
    bool isChoosed;

    ResultList({
        this.isRight,
        this.isChoosed,
    });

    factory ResultList.fromJson(Map<String, dynamic> json) => new ResultList(
        isRight: json["isRight"],
        isChoosed: json["isChoosed"],
    );

    Map<String, dynamic> toJson() => {
        "isRight": isRight,
        "isChoosed": isChoosed,
    };
}