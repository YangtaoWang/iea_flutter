import 'dart:async';
import 'package:iea/provider/base/base_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/provider/base/network_config.dart';

class CourseExamResultPageApiProvider extends BaseApiProvider {

  /*
  *  获取随堂考结果
  * @links
  */
  Future<BaseResp> getCourseExamResult(Map<String, dynamic> params) async {
    final response =
        await get(NetworkConfig.courseExamResultPageApi['getCourseExamResult'], params);
    return super.verifyMiddleWare(response);
  }
}
