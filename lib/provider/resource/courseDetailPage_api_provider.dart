import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class CourseDetailPageApiProvider extends BaseApiProvider {
  /*
  *  获取详情页图片列表
  * @links
  */
  Future<BaseResp> getImgList(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.courseDetailPageApi['getImgList'], params);
    return super.verifyMiddleWare(response);
  }
}