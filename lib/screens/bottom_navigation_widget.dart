import 'package:flutter/material.dart';
// import 'homePage/home_screen.dart';
// import 'minePage/mine_screen.dart';
// import 'indexPage/index_page.dart';
import 'courseDetailPage/courseDetail_page.dart';
import 'mineCoursePage/mineCourse_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>
    with SingleTickerProviderStateMixin {
  // final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          // HomeScreen(),
          // MineScreen(),
          // IndexPage(),
          // HomeScreen(),
          CourseDetailPage(num: 1),
          MineCoursePage()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: _currentIndex == 0
                  ? new Image.asset(
                      'assets/images/homepage/Page1Copy4@2x.png',
                      width: 25,
                      height: 25,
                    )
                  : new Image.asset(
                      'assets/images/homepage/Page1Copy6@2x.png',
                      width: 25,
                      height: 25,
                    ),
              title: new Text("首页",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
          BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? new Image.asset(
                      'assets/images/homepage/Page1Copy2@2x.png',
                      width: 25,
                      height: 25,
                    )
                  : new Image.asset(
                      'assets/images/homepage/Page1@2x.png',
                      width: 25,
                      height: 25,
                    ),
              title: new Text("我的",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
        ],
      ),
    );
  }
}
