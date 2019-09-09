import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';
// import 'package:iea/provider/base/base_resp.dart';
// import 'package:iea/provider/base/network_config.dart';

class PlayerPageApiProvider extends BaseApiProvider {
  /*
  *  获取公开课类型
  * @links
  */
  Future downloadFile(url, saveUrl) async {
    final response =
        await download(url, saveUrl);
    return response;
  }
  Future<BaseResp> getPlayer(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.playerPageApi['playerData'], params);
    return super.verifyMiddleWare(response);
  }
}