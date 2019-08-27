import 'package:flutter/material.dart';
import 'package:iea/screens/courseDetailPage/courseDetail_page.dart';
// import 'package:iea/screens/indexPage/index_page.dart';
// import 'package:iea/screens/mineCoursePage/mineCourse_page.dart';
import 'package:iea/screens/courseExamPage/courseExam_page.dart';
import 'package:iea/screens/courseExamResultPage/courseExamResult_page.dart';
import 'package:iea/screens/feedbackPage/feedback_page.dart';
import 'package:iea/screens/playerPage/player_page.dart';
import 'package:iea/screens/mainPage/main_page.dart';
import 'package:iea/screens/phonePage/phone_page.dart';
import 'package:iea/screens/loginPage/login_page.dart';
import 'package:iea/screens/settingPage/setting_page.dart';
// import 'package:iea/screens/minepage/mine_screen.dart';
import 'package:iea/screens/myCoursePage/myCourse_page.dart';
import 'package:iea/screens/myPage/my_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/index.dart';
import 'package:iea/redux/appState.dart';
// import 'package:iea/redux/AppState.dart';
// import 'package:iea/redux/AppReducer.dart';
// import 'package:iea/redux/reducer.dart';
// import 'dart:developer';
// import 'package:iea/redux/appActions.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';

import 'package:flutter/rendering.dart';

void main() {
  // store.dispatch(LoginSuccessAction(token: 'new asfasfasfToken'));
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: HomePage(title: 'iea'),
        routes: {
          '/courseExam': (context)=> CourseExamPage(isExaming: true, currentPage: 0),
          '/courseExamAnswer': (context)=> CourseExamResultPage(),
          '/detail': (context)=> CourseDetailPage(num: 1),
          '/feedback': (context)=> FeedbackPage(),
          '/player': (context) => PlayerPage(),
          '/phone': (context) => PhonePage(),
          '/my': (context) => MyPage(),
          '/login': (context) => LoginPage(phone: ''),
          '/setting': (context) => SettingPage()
        },
      )
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key,this.title}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final widgetItems = [MainPage(), MyCoursePage(), MyPage()];
  List<String> widgetNames = ['IEA认证', '我的课程' ,'我的'];
  @override
  Widget build(BuildContext context) {
    // if (Platform.isAndroid) {
    //   // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    //   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }
    return Scaffold(
      // 顶栏
      appBar: AppBar(
        title: _currentIndex != 2 ? Text(widgetNames[_currentIndex], style: TextStyle(color: Colors.black),) : Text(''),
        backgroundColor: _currentIndex != 2 ? Colors.white : Color.fromRGBO(243, 110, 34, 1),
        elevation: 0,
        centerTitle: true,
        actions: _currentIndex == 2 ? <Widget>[
          Row(
            children: <Widget>[
              Image.asset('assets/images/mypage/weixin.png', width: 18, height: 18),
              Container(
                margin: EdgeInsets.only(right: 17, left: 5),
                child: Text('客服', style: TextStyle(fontSize: 13))
              )
            ],
          )
        ] : <Widget>[],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: widgetItems,
      ),
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0 ? Image.asset('assets/images/homepage/Page1Copy4@2x.png',width: 25,height: 25,):Image.asset('assets/images/homepage/Page1Copy6@2x.png',width: 25,height: 25,),
            title: Text('首页', style: TextStyle(color: Color(0xFF06244e), fontSize: 14), )
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1 ? Image.asset('assets/images/homepage/icon_me_course_sel.png',width: 25,height: 25,):Image.asset('assets/images/homepage/icon_me_course_unsel.png',width: 25,height: 25,) ,
            title: Text('我的课程', style: TextStyle(color: Color(0xFF06244e), fontSize: 14), )
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2? Image.asset('assets/images/homepage/Page1Copy2@2x.png',width: 25,height: 25,):Image.asset('assets/images/homepage/Page1@2x.png',width: 25,height: 25,) ,
            title: Text('我的', style: TextStyle(color: Color(0xFF06244e), fontSize: 14), )
          )
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTaped,
      ),
    );

  }
  void _onItemTaped (int index){
    setState(() {
      _currentIndex = index;
    });
  }
}