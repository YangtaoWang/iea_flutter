import 'dart:async';

import 'package:iea/models/goodDetailPage_models/goodDetail_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/goodDetailPage_api_provider.dart';

class GoodDetailBloc {

  // 初始化请求方法
  final provider = GoodDetailPageApiProvider();

   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _goodDetailSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _goodDetailController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get goodDetail => _goodDetailController.stream;



  void getGoodDetail (params) {
    // 数据异常 => cancel
    _goodDetailSubcrition?.cancel();

    _goodDetailSubcrition = provider.goodDetail(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = GoodDetailModle.fromJson(data.data);
      }
      _goodDetailController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _goodDetailSubcrition?.cancel();
    _goodDetailController.close();
  }
}
