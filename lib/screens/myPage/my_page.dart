import 'package:flutter/material.dart';
import 'dart:ui';
class MyPage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context){
    final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
    print(statusBarHeight);
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: statusBarHeight),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/mypage/icon_me_bg.png'), fit: BoxFit.cover)
                  ),
                  child: Text('asfd'),
                )
              )
              
            ],
          ),
        )
      
    );
  }
}