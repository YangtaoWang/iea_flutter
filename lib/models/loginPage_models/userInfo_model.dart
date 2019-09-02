// class UserInfo {
//     String account;
//     dynamic birthday;
//     dynamic createBy;
//     DateTime createTime;
//     String headImg;
//     int id;
//     String mobile;
//     String mobileSecret;
//     String password;
//     dynamic registChannelId;
//     int registType;
//     dynamic sex;
//     int status;
//     int sunlandsUserId;
//     dynamic updateBy;
//     DateTime updateTime;
//     String userNo;
//     String username;

//     UserInfo({
//         this.account,
//         this.birthday,
//         this.createBy,
//         this.createTime,
//         this.headImg,
//         this.id,
//         this.mobile,
//         this.mobileSecret,
//         this.password,
//         this.registChannelId,
//         this.registType,
//         this.sex,
//         this.status,
//         this.sunlandsUserId,
//         this.updateBy,
//         this.updateTime,
//         this.userNo,
//         this.username,
//     });

//     factory UserInfo.fromJson(Map<String, dynamic> json) => new UserInfo(
//         account: json["account"],
//         birthday: json["birthday"],
//         createBy: json["createBy"],
//         createTime: DateTime.parse(json["createTime"]),
//         headImg: json["headImg"],
//         id: json["id"],
//         mobile: json["mobile"],
//         mobileSecret: json["mobileSecret"],
//         password: json["password"],
//         registChannelId: json["registChannelId"],
//         registType: json["registType"],
//         sex: json["sex"],
//         status: json["status"],
//         sunlandsUserId: json["sunlandsUserId"],
//         updateBy: json["updateBy"],
//         updateTime: DateTime.parse(json["updateTime"]),
//         userNo: json["userNo"],
//         username: json["username"],
//     );

//     Map<String, dynamic> toJson() => {
//         "account": account,
//         "birthday": birthday,
//         "createBy": createBy,
//         "createTime": createTime.toIso8601String(),
//         "headImg": headImg,
//         "id": id,
//         "mobile": mobile,
//         "mobileSecret": mobileSecret,
//         "password": password,
//         "registChannelId": registChannelId,
//         "registType": registType,
//         "sex": sex,
//         "status": status,
//         "sunlandsUserId": sunlandsUserId,
//         "updateBy": updateBy,
//         "updateTime": updateTime.toIso8601String(),
//         "userNo": userNo,
//         "username": username,
//     };
// }

class UserInfo {
    dynamic account;
    dynamic birthday;
    dynamic createBy;
    DateTime createTime;
    String headImg;
    int id;
    String mobile;
    String mobileSecret;
    dynamic password;
    dynamic registChannelId;
    int registType;
    dynamic sex;
    int status;
    int sunlandsUserId;
    dynamic updateBy;
    dynamic updateTime;
    String userNo;
    String username;

    UserInfo({
        this.account,
        this.birthday,
        this.createBy,
        this.createTime,
        this.headImg,
        this.id,
        this.mobile,
        this.mobileSecret,
        this.password,
        this.registChannelId,
        this.registType,
        this.sex,
        this.status,
        this.sunlandsUserId,
        this.updateBy,
        this.updateTime,
        this.userNo,
        this.username,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => new UserInfo(
        account: json["account"],
        birthday: json["birthday"],
        createBy: json["createBy"],
        createTime: DateTime.parse(json["createTime"]),
        headImg: json["headImg"],
        id: json["id"],
        mobile: json["mobile"],
        mobileSecret: json["mobileSecret"],
        password: json["password"],
        registChannelId: json["registChannelId"],
        registType: json["registType"],
        sex: json["sex"],
        status: json["status"],
        sunlandsUserId: json["sunlandsUserId"],
        updateBy: json["updateBy"],
        updateTime: json["updateTime"],
        userNo: json["userNo"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "account": account,
        "birthday": birthday,
        "createBy": createBy,
        "createTime": createTime.toIso8601String(),
        "headImg": headImg,
        "id": id,
        "mobile": mobile,
        "mobileSecret": mobileSecret,
        "password": password,
        "registChannelId": registChannelId,
        "registType": registType,
        "sex": sex,
        "status": status,
        "sunlandsUserId": sunlandsUserId,
        "updateBy": updateBy,
        "updateTime": updateTime,
        "userNo": userNo,
        "username": username,
    };
}