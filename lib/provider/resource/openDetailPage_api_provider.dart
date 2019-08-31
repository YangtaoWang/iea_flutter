import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class OpenDetailPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future<BaseResp> getDetail(Map<String, dynamic> params) async {
    final response = await get(NetworkConfig.openDetailPageApi['getDetail'], params);
    return super.verifyMiddleWare(response);
  }

  Future<BaseResp> checkIn(Map<String, dynamic> params) async {
    final response = await get(NetworkConfig.openDetailPageApi['checkIn'], params);
    return super.verifyMiddleWare(response);
  }
}