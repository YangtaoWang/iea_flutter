import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class MyCoursePageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> getMyCourse(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.myCoursePageApi['getMyCourse'], params);
    return super.verifyMiddleWare(response);
  }
}