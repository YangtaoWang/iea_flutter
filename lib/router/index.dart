import 'package:iea/screens/courseExamPage/courseExam_page.dart';
import 'package:iea/screens/courseExamResultPage/courseExamResult_page.dart';
import 'package:iea/screens/feedbackPage/feedback_page.dart';
import 'package:iea/screens/playerPage/player_page.dart';
import 'package:iea/screens/phonePage/phone_page.dart';
import 'package:iea/screens/loginPage/login_page.dart';
import 'package:iea/screens/settingPage/setting_page.dart';
import 'package:iea/screens/myPage/my_page.dart';
import 'package:iea/screens/courseDetailPage/courseDetail_page.dart';

final routes = {
  '/courseExam': (context)=> CourseExamPage(isExaming: true, currentPage: 0),
  '/courseExamAnswer': (context)=> CourseExamResultPage(),
  '/detail': (context)=> CourseDetailPage(num: 1),
  '/feedback': (context)=> FeedbackPage(),
  '/player': (context) => PlayerPage(),
  '/phone': (context) => PhonePage(),
  '/my': (context) => MyPage(),
  '/login': (context) => LoginPage(phone: ''),
  '/setting': (context) => SettingPage()
};