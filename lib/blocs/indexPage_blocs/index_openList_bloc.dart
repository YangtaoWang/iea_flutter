import 'package:iea/provider/resource/indexpage_api_provider.dart';
import 'dart:async';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';

class OpenListBloc {
  final _apiClient = IndexPageApiProvider();

  StreamSubscription<BaseResp> _openListSubscription;
  final StreamController<BaseResp> _openClassListController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get getopenClassListStream => _openClassListController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  void getopenClassList(params) {
    _openListSubscription?.cancel();
    _openListSubscription = _apiClient
        .openClassList(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => IndexOpenClassModel.fromJson(value))
            .toList();
      }
      _openClassListController.add(data);
    });
  }

  void dispose() {
    _openListSubscription?.cancel();
    _openClassListController.close();
  }
}