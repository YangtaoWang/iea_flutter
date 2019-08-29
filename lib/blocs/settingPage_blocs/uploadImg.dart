import 'dart:async';

import 'package:iea/models/settingPage_models/wxInfo_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/settingPage_api_provider.dart';

class UploadImgBloc {

  // 初始化请求方法
  final provider = SettingPageApiProvider();

   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _upLoadImgSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _upLoadImgController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get upLoadImgStream => _upLoadImgController.stream;



  void upLoadImg (params) {
    // 数据异常 => cancel
    _upLoadImgSubcrition?.cancel();

    _upLoadImgSubcrition = provider.upLoadImg(params).asStream().listen((BaseResp data) {
      // if (data.result) {
      //   data.data = WxInfo.fromJson(data.data);
      // }
      _upLoadImgController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _upLoadImgSubcrition?.cancel();
    _upLoadImgController.close();
  }
}
