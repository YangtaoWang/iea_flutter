import 'dart:async';

import 'package:iea/models/settingPage_models/wxInfo_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/settingPage_api_provider.dart';

class WxInfoBloc {

  // 初始化请求方法
  final provider = SettingPageApiProvider();

   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _wxInfoSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _wxInfoController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get wxInfo => _wxInfoController.stream;



  void getWX () {
    // 数据异常 => cancel
    _wxInfoSubcrition?.cancel();

    _wxInfoSubcrition = provider.getWX().asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = WxInfo.fromJson(data.data);
      }
      _wxInfoController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _wxInfoSubcrition?.cancel();
    _wxInfoController.close();
  }
}
