import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class LoginPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> login(Map<String, dynamic> params) async {
    final response =
        await post(NetworkConfig.loginPageApi['login'], params);
    return super.verifyMiddleWare(response);
  }
}