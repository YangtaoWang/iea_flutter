import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class SettingPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> logout() async {
    final response =
        await get(NetworkConfig.settingPageApi['logout']);
    return super.verifyMiddleWare(response);
  }
}