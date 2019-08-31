import 'dart:async';

import 'package:iea/models/openDetailPage_models/openDetail_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/openDetailPage_api_provider.dart';

class OpenDetailBloc {

  // 初始化请求方法
  final provider = OpenDetailPageApiProvider();

   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _openDetailSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _openDetailController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get openDetail => _openDetailController.stream;



  void getOpenDetail (params) {
    // 数据异常 => cancel
    _openDetailSubcrition?.cancel();

    _openDetailSubcrition = provider.getDetail(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = OpenDetailModel.fromJson(data.data);
      }
      _openDetailController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _openDetailSubcrition?.cancel();
    _openDetailController.close();
  }
}
