import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class GoodDetailPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> goodDetail(Map<String, dynamic> params) async {
    final response = await get(NetworkConfig.goodDetailPageApi['goodDetail'], params);
    return super.verifyMiddleWare(response);
  }
}