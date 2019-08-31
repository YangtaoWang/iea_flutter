class IosDeviceInfoModel {
    String deviceVersion;
    String deviceId;
    String deviceType;

    IosDeviceInfoModel({
        this.deviceVersion,
        this.deviceId,
        this.deviceType,
    });

    factory IosDeviceInfoModel.fromJson(Map<String, dynamic> json) => new IosDeviceInfoModel(
        deviceVersion: json["deviceVersion"],
        deviceId: json["deviceId"],
        deviceType: json["deviceType"],
    );

    Map<String, dynamic> toJson() => {
        "deviceVersion": deviceVersion,
        "deviceId": deviceId,
        "deviceType": deviceType,
    };
}