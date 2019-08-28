import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class MyInfoPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> changeUserInfo(Map<String, dynamic> params) async {
    final response =
        await post(NetworkConfig.myInfoPageApi['changeUserInfo'], params);
    return super.verifyMiddleWare(response);
  }
}