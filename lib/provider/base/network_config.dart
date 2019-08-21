import 'api_config.dart';

class NetworkConfig {
  static final hostUrl = ApiConfig.hostUrl;
  static final platFormHost = ApiConfig.platFormHost;
  static final isProd = ApiConfig.isProd;
  static final authKey = ApiConfig.authKey;

  static final Map<String, String> indexPageApi = {
    'getIndexBanner': hostUrl + 'index/getIndexBanner',
    'indexMenuClassList': hostUrl + 'index/indexMenuClass/list',
    'openClassList': hostUrl + 'index/openClass/list',
  };
  static final Map<String, String> homePageApi = {
    'getOpenClassTypeList': hostUrl + 'index/project',
    'openClassList': hostUrl + 'index/openClass',
  };

  static final Map<String, String> minePageApi = {
    'getOpenClassTypeList': hostUrl + 'index/project',
    'openClassList': hostUrl + 'index/openClass',
  };
  static final Map<String, String> courseDetailPageApi = {
    'getImgList': 'https://m.yimg.vip/mock/5d1ec87d5537032718aafb02/iea_flutter/getImgList'
  };
  static final Map<String, String> courseExamPageApi = {
    'getCourseExamList': 'https://m.yimg.vip/mock/5d1ec87d5537032718aafb02/iea_flutter/getCourseExam',
    'getCourseExamResult': 'https://m.yimg.vip/mock/5d1ec87d5537032718aafb02/iea_flutter/getExamExp'
  };
  static final Map<String, String> courseExamResultPageApi = {
    'getCourseExamResult': 'https://m.yimg.vip/mock/5d1ec87d5537032718aafb02/iea_flutter/getExamResult'
  };
  static final Map<String, String> mineCoursePageApi = {
    // 'getList': 'https://m.yimg.vip/mock/5ce75f365537032718aafad6/SunLands/mineCourse#!method=get'
    'getList': 'https://m.yimg.vip/mock/5ce75f365537032718aafad6/SunLands/mineCourseT'
    // 'getList': 'http://172.18.70.95:8200/sunlands-app-api/course/courseList'
  };
  static final Map<String, String> feedbackPageApi = {
    'postFeedback': 'http://172.18.70.102:8200/sunlands-app-api/feedback/commit'
  };
}