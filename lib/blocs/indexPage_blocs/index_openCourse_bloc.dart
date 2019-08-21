import 'dart:async';

import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/models/indexPage_models/index_openCourse_model.dart';
import 'package:iea/provider/resource/indexpage_api_provider.dart';

class GetIndexBannerListBloc {
  final _apiClient = IndexPageApiProvider();

  StreamSubscription<BaseResp> _getIndexBannerSubscription;
  final StreamController<BaseResp> _getIndexBannerController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get indexBannerStream => _getIndexBannerController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  void getIndexBannerList(params) {
    _getIndexBannerSubscription?.cancel();
    _getIndexBannerSubscription = _apiClient
        .getIndexBanner(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => IndexOpenCourseModel.fromJson(value))
            .toList();
      }
      _getIndexBannerController.add(data);
    });
  }

  void dispose() {
    _getIndexBannerSubscription?.cancel();
    _getIndexBannerController.close();
  }
}
