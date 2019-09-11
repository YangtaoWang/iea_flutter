import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/provider/base/network_config.dart';

class OpenPlayerPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> getOpenPlayer(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.openPlayerPageApi['openPlayer'], params);
    return super.verifyMiddleWare(response);
  }
}