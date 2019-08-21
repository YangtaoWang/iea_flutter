import 'dart:async';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/models/courseExamResultPage_models/courseExamResult_model.dart';
import 'package:iea/provider/resource/courseExamResultpage_api_provider.dart';

class ExamResultBloc {
  final _apiClient = CourseExamResultPageApiProvider();

  StreamSubscription<BaseResp> _examResultSubscription;
  final StreamController<BaseResp> _examResultController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get examResultStream => _examResultController.stream;

  /*
  *  获取公开课信息列表
  * @links
  */
  void getExamResult(params) {
    _examResultSubscription?.cancel();
    _examResultSubscription =
        _apiClient.getCourseExamResult(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = ExamResultDataModel.fromJson(data.data);
      }
      _examResultController.add(data);
    });
  }

  void dispose() {
    _examResultSubscription?.cancel();
    _examResultController.close();
  }
}
