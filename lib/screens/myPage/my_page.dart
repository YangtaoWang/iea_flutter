import 'package:flutter/material.dart';
// import 'dart:ui';
class MyPage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/mypage/icon_me_bg.png'), fit: BoxFit.fill)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/mypage/icon_default_photo.png')
                        ),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 5, color: Color.fromRGBO(151, 151, 151, .3), style: BorderStyle.solid)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text('登录/注册', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/feedback');
                        },
                        child: Container(
                          height: 62,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(151, 151, 151, .1), style: BorderStyle.solid))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset('assets/images/mypage/feedback.png', width: 16, height: 16, fit: BoxFit.cover,),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('意见反馈', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18)),
                                  )
                                ],
                              ),
                              Image.asset('assets/images/mypage/arrowright.png', width: 15, height: 15, fit: BoxFit.cover,)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 62,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset('assets/images/mypage/setting.png', width: 16, height: 16, fit: BoxFit.cover,),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('设置', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18)),
                                )
                              ],
                            ),
                            Image.asset('assets/images/mypage/arrowright.png', width: 15, height: 15, fit: BoxFit.cover,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      
    );
  }
}