import 'dart:async';

import 'package:iea/models/myCoursePage_models/myCourse_model.dart';

import 'package:iea/provider/base/base_resp.dart';

import 'package:iea/provider/resource/myCoursePage_api_provider.dart';

class MyCourseBloc {

  // 初始化请求方法
  final provider = MyCoursePageApiProvider();

   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _myCourseSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _myCourseController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get myCourse => _myCourseController.stream;



  void getList (params) {
    // 数据异常 => cancel
    _myCourseSubcrition?.cancel();

    _myCourseSubcrition = provider.getMyCourse(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = MyCourseModel.fromJson(data.data);
      }
      _myCourseController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _myCourseSubcrition?.cancel();
    _myCourseController.close();
  }
}
