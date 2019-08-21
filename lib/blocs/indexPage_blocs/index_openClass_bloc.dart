import 'dart:async';

import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/models/indexPage_models/index_openClass_model.dart';
import 'package:iea/provider/resource/indexpage_api_provider.dart';

class GetopenClassListBloc {
  final _apiClient = IndexPageApiProvider();

  StreamSubscription<BaseResp> _getopenClassListSubscription;
  final StreamController<BaseResp> _getopenClassListController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get getopenClassListStream => _getopenClassListController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  void getopenClassList(params) {
    _getopenClassListSubscription?.cancel();
    _getopenClassListSubscription = _apiClient
        .openClassList(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => IndexOpenClassModel.fromJson(value))
            .toList();
      }
      _getopenClassListController.add(data);
    });
  }

  void dispose() {
    _getopenClassListSubscription?.cancel();
    _getopenClassListController.close();
  }
}
