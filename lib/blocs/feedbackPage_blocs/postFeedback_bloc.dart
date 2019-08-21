import 'dart:async';
// import 'package:iea/models/feedbackPage_models/imgList_model.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/resource/feedbackPage_api_provider.dart';

class FeedbackBloc {
  final _apiClient = FeedbackPageApiProvider();

  StreamSubscription<BaseResp> feedbackSubscription;
  final StreamController<BaseResp> feedbackController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get feedbackStream => feedbackController.stream;

  /*
  *  获取公开课信息列表
  * @links
  */
  void postFeedback([params]) {
    feedbackSubscription?.cancel();
    feedbackSubscription =
        _apiClient.postFeedback(params).asStream().listen((BaseResp data) {
         if (data.result) {
        // data.data = (data.data as List)
        //     .map((value) => ImgListDataModel.fromJson(value))
        //     .toList();
      }
      feedbackController.add(data);
    });
  }

  void dispose() {
    feedbackSubscription?.cancel();
    feedbackController.close();
  }
}
