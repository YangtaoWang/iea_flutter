import 'dart:async';

import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/models/homepage_models/openclasstype_model.dart';
import 'package:iea/provider/resource/homepage_api_provider.dart';

class OpenClassTypeListBloc {
  final _apiClient = HomePageApiProvider();

  StreamSubscription<BaseResp> _openClassTypeSubscription;
  final StreamController<BaseResp> _openClassTypeController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get openClassStream => _openClassTypeController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  void getOpenClassENList(params) {
    _openClassTypeSubscription?.cancel();
    _openClassTypeSubscription = _apiClient
        .getOpenClassTypeList(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => OpenClassTypeModel.fromJson(value))
            .toList();
      }
      _openClassTypeController.add(data);
    });
  }

  void dispose() {
    _openClassTypeSubscription?.cancel();
    _openClassTypeController.close();
  }
}
