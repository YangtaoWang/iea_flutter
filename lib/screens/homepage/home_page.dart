

import 'package:flutter/material.dart';
import 'package:iea/screens/myCoursePage/myCourse_page.dart';
import 'package:iea/screens/myPage/my_page.dart';
import 'package:iea/screens/mainPage/main_page.dart';
import 'package:iea/widgets/serviceToast.dart';
import 'package:iea/sp/index.dart';
// import 'package:iea/screens/indexPage/index_page.dart';
// import 'package:iea/screens/mineCoursePage/mineCourse_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final widgetItems = [MainPage(), MyCoursePage(), MyPage()];
  List<String> widgetNames = ['IEA认证', '我的课程' ,'我的'];
  _getUserInfo() async{
    String res = await SP().getData('userInfo');
    return res != null;
  }
  _showService (BuildContext context) async { // 调起性别弹窗
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogController) {
        return ServiceToast();
      },
    );
    print("result = $result");
  }
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
          GestureDetector(
            onTap: () {
              _showService(context);
            },
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/mypage/weixin.png', width: 18, height: 18),
                Container(
                  margin: EdgeInsets.only(right: 17, left: 5),
                  child: Text('客服', style: TextStyle(fontSize: 13))
                )
              ],
            )
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
  void _onItemTaped (int index) async{
    if(index == 1) {
      if(!await _getUserInfo()) {
        Navigator.pushNamed(context, '/phone');
        return;
      }
    }
    setState(() {
      _currentIndex = index;
    });
  }
}