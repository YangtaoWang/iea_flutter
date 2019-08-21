import 'dart:convert' show json;

class OpenClassTypeModel {
  String projectName;
  int projectId;

  OpenClassTypeModel.fromParams({this.projectName, this.projectId});

  factory OpenClassTypeModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new OpenClassTypeModel.fromJson(json.decode(jsonStr))
          : new OpenClassTypeModel.fromJson(jsonStr);

  OpenClassTypeModel.fromJson(jsonRes) {
    projectName = jsonRes['projectName'];
    projectId = jsonRes['projectId'];
  }

  @override
  String toString() {
    return '{"projectName": ${projectName != null ? '${json.encode(projectName)}' : 'null'}, "projectId": ${projectId != null ? '${json.encode(projectId)}' : 'null'}}}';
  }
}
