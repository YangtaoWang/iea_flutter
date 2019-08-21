import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class IndexPageApiProvider extends BaseApiProvider {
  // 首页广告图
  Future<BaseResp> getIndexBanner(Map<String, dynamic> params) async {
    final response =
        await post(NetworkConfig.indexPageApi['getIndexBanner'], params);
    return super.verifyMiddleWare(response);
  }
  // 公开课推荐课程列表
  Future<BaseResp> openClassList(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.indexPageApi['openClassList'], params);
    return super.verifyMiddleWare(response);
  }
  // 精品课列表
  Future<BaseResp> indexMenuClassList(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.indexPageApi['indexMenuClassList'], params);
    return super.verifyMiddleWare(response);
  }
}
