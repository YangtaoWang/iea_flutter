import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class CourseExamPageApiProvider extends BaseApiProvider {
  /*
  *  获取详情页图片列表
  * @links
  */
  Future<BaseResp> getCourseExamList(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.courseExamPageApi['getCourseExamList'], params);
    return super.verifyMiddleWare(response);
  }
  /*
  *  获取详情页图片列表
  * @links
  */
  Future<BaseResp> getCourseExamResult(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.courseExamPageApi['getCourseExamResult'], params);
    return super.verifyMiddleWare(response);
  }
}