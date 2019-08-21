import 'dart:async';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/models/homepage_models/openclass_model.dart';
import 'package:iea/provider/resource/homepage_api_provider.dart';

class OpenClassBloc {
  final _apiClient = HomePageApiProvider();

  StreamSubscription<BaseResp> _openClassSubscription;
  final StreamController<BaseResp> _openClassController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get openClassStream => _openClassController.stream;

  /*
  *  获取公开课信息列表
  * @links
  */
  void getOpenClassENList(params) {
    _openClassSubscription?.cancel();
    _openClassSubscription =
        _apiClient.getOpenClassList(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = OpenClassModel.fromJson(data.data);
      }
      _openClassController.add(data);
    });
  }

  void dispose() {
    _openClassSubscription?.cancel();
    _openClassController.close();
  }
}
