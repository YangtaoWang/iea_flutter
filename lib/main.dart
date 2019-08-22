import 'package:flutter/material.dart';
import 'package:iea/screens/courseDetailPage/courseDetail_page.dart';
// import 'package:iea/screens/indexPage/index_page.dart';
import 'package:iea/screens/mineCoursePage/mineCourse_page.dart';
import 'package:iea/screens/courseExamPage/courseExam_page.dart';
import 'package:iea/screens/courseExamResultPage/courseExamResult_page.dart';
import 'package:iea/screens/feedbackPage/feedback_page.dart';
import 'package:iea/screens/playerPage/player_page.dart';
import 'package:iea/screens/minepage/mine_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/index.dart';
import 'package:iea/redux/appState.dart';
// import 'package:iea/redux/AppState.dart';
// import 'package:iea/redux/AppReducer.dart';
// import 'package:iea/redux/reducer.dart';
// import 'dart:developer';
import 'package:iea/redux/appActions.dart';

import 'package:flutter/rendering.dart';

void main() {
  // final store = Store<CountState>(reducer, initialState: CountState.initState());
  // Store<AppState> createStore() {
  //   return Store(
  //     appReducer,
  //     initialState: AppState.initial()
  //   );
  // }
  // final store = createStore();
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
        home:HomePage(title: 'iea'),
        routes: {
          '/test': (context)=> CourseDetailPage(num: 1),
          '/courseExam': (context)=> CourseExamPage(isExaming: true, currentPage: 0),
          '/courseExamAnswer': (context)=> CourseExamResultPage(),
          '/detail': (context)=> CourseDetailPage(num: 1),
          '/feedback': (context)=> FeedbackPage(),
          '/player': (context) => PlayerPage(),
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
  final widgetItems = [MineScreen(), MineCoursePage(), CourseDetailPage(num: 1)];
  List<String> widgetNames = ['首页', '我的课程' ,'我的'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶栏
      appBar: AppBar(
        title: Text(widgetNames[_currentIndex], style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      // 主内容区
      // body: Center(
      //   child: widgetItems[_currentIndex],
      // ),
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
            icon: _currentIndex == 1 ? Image.asset('assets/images/homepage/Page1Copy2@2x.png',width: 25,height: 25,):Image.asset('assets/images/homepage/Page1@2x.png',width: 25,height: 25,) ,
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
    // Navigator.pushNamed(context, '/test', arguments: 0);
    setState(() {
      _currentIndex = index;
    });
  }
}