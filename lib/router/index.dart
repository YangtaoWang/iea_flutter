import 'package:iea/screens/courseExamPage/courseExam_page.dart';
import 'package:iea/screens/courseExamResultPage/courseExamResult_page.dart';
import 'package:iea/screens/feedbackPage/feedback_page.dart';
import 'package:iea/screens/playerPage/player_page.dart';
import 'package:iea/screens/phonePage/phone_page.dart';
import 'package:iea/screens/loginPage/login_page.dart';
import 'package:iea/screens/settingPage/setting_page.dart';
import 'package:iea/screens/myPage/my_page.dart';
// import 'package:iea/screens/courseDetailPage/courseDetail_page.dart';
import 'package:iea/screens/myInfoPage/myInfo_page.dart';
import 'package:iea/screens/policyPage/policy_page.dart';
import 'package:iea/screens/homepage/home_page.dart';
import 'package:iea/screens/splashPage/firstPage.dart';
import 'package:iea/screens/splashPage/guidePage.dart';
import 'package:iea/screens/splashPage/webView.dart';
import 'package:iea/screens/openDetailPage/openDetail_page.dart';
import 'package:iea/screens/goodDetailPage/goodDetai_page.dart';
import 'package:iea/screens/splashPage/web.dart';
import 'package:iea/screens/test/testPage.dart';

final routes = {
  '/courseExam': (context)=> CourseExamPage(isExaming: true, currentPage: 0),
  '/courseExamAnswer': (context)=> CourseExamResultPage(),
  // '/detail': (context)=> CourseDetailPage(num: 1),
  '/feedback': (context)=> FeedbackPage(),
  '/player': (context) => PlayerPage(goodsId: 0, videoId: 0, moduleLessonId: 0),
  '/phone': (context) => PhonePage(),
  '/my': (context) => MyPage(),
  '/login': (context) => LoginPage(phone: ''),
  '/setting': (context) => SettingPage(),
  '/myInfo': (context) => MyInfoPage(),
  '/policy': (context) => PolicyPage(type: ''),
  '/home': (context) => HomePage(),
  '/first': (context) => FirstPage(),
  '/guide': (context) => GuidePage(),
  '/webView': (context) => WebViewPage(url: ''),
  '/openDetail': (context) => OpenDetailPage(openClassId: '',),
  '/goodDetail': (context) => GoodDetailPage(goodsId: '',),
  '/web': (context) => WebPage(url: '', fromPage: '',),
  '/test': (context) => TestPage(),
};