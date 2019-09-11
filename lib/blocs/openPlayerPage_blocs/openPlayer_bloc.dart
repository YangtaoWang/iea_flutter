import 'dart:async';

import 'package:iea/models/openPlayerPage_models/openPlayer_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/openPlayerPage_api_provider.dart';

class OpenPlayerBloc {

  // 初始化请求方法
  final provider = OpenPlayerPageApiProvider();
   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _openPlayerSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _openPlayerController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get openPlayer => _openPlayerController.stream;



  void getOpenPlayer (params) {
    // 数据异常 => cancel
    _openPlayerSubcrition?.cancel();

    _openPlayerSubcrition = provider.getOpenPlayer(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = OpenPlayerModle.fromJson(data.data);
      }
      _openPlayerController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _openPlayerSubcrition?.cancel();
    _openPlayerController.close();
  }
}
