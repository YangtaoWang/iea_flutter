import 'dart:async';

import 'package:iea/models/playerPage_modles/player_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/playerPage_api_provider.dart';

class PlayerBloc {

  // 初始化请求方法
  final provider = PlayerPageApiProvider();
   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _playerSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _playerController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get player => _playerController.stream;



  void getPlayer (params) {
    // 数据异常 => cancel
    _playerSubcrition?.cancel();

    _playerSubcrition = provider.getPlayer(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = PlayerModle.fromJson(data.data);
      }
      _playerController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _playerSubcrition?.cancel();
    _playerController.close();
  }
}
