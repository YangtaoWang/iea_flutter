import 'dart:async';

import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/models/indexPage_models/index_goodCourse_model.dart';
import 'package:iea/provider/resource/indexpage_api_provider.dart';

class IndexMenuClassListBloc {
  final _apiClient = IndexPageApiProvider();

  StreamSubscription<BaseResp> _indexMenuClassSubscription;
  final StreamController<BaseResp> _indexMenuClassController =
      StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get indexMenuClassListStream => _indexMenuClassController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  void indexMenuClassList() {
    _indexMenuClassSubscription?.cancel();
    _indexMenuClassSubscription = _apiClient
        .indexMenuClassList()
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => IndexGoodCourseModel.fromJson(value))
            .toList();
      }
      _indexMenuClassController.add(data);
    });
  }

  void dispose() {
    _indexMenuClassSubscription?.cancel();
    _indexMenuClassController.close();
  }
}