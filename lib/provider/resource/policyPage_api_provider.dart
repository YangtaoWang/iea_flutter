import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class PolicyPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> getPolicy(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.policyPageApi['getPolicy'], params);
    return super.verifyMiddleWare(response);
  }
}