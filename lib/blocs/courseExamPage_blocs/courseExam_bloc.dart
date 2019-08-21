import 'dart:async';
import 'package:iea/models/courseExamPage_models/courseExam_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/resource/courseExamPage_api_provider.dart';

class CourseExamBloc {
  final _apiClient = CourseExamPageApiProvider();

  StreamSubscription<BaseResp> _courseExamSubscription;
  final StreamController<BaseResp> _courseExamController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get courseExamStream => _courseExamController.stream;

  /*
  *  获取公开课信息列表
  * @links
  */
  void getCourseExamList(params) {
    _courseExamSubscription?.cancel();
    _courseExamSubscription =
        _apiClient.getCourseExamList(params).asStream().listen((BaseResp data) {
         if (data.result) {
        data.data = (data.data as List)
            .map((value) => CourseExamDataModel.fromJson(value))
            .toList();
      }
      _courseExamController.add(data);
    });
  }
  void getCourseExamResult(params) {
    _courseExamSubscription?.cancel();
    _courseExamSubscription =
        _apiClient.getCourseExamResult(params).asStream().listen((BaseResp data) {
         if (data.result) {
        data.data = (data.data as List)
            .map((value) => CourseExamDataModel.fromJson(value))
            .toList();
      }
      _courseExamController.add(data);
    });
  }

  void dispose() {
    _courseExamSubscription?.cancel();
    _courseExamController.close();
  }
}
