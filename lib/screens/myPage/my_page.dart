import 'package:flutter/material.dart';
import 'package:iea/sp/index.dart';
import 'package:iea/models/loginPage_models/userInfo_model.dart';
import 'dart:convert' as convert;

class MyPage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  String userImg;
  String userName; 
  _getUserInfo() async{
    String res = await SP().getData('userInfo');
    if(res != null) {
      UserInfo userInfo = UserInfo.fromJson(convert.jsonDecode(res));
      setState(() {
        userImg = userInfo.headImg;
        userName = userInfo.username;
      });
    } else {
      setState(() {
        userImg = null;
        userName = null;
      });
    }
  }
  @override
  void deactivate(){
    _getUserInfo();
    super.deactivate();
  }
  @override
  void initState() {
    // SP().removeData('userInfo');
    _getUserInfo();
    super.initState();
  }
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
                          image: userImg == null ? AssetImage('assets/images/mypage/icon_default_photo.png') : NetworkImage(userImg)
                        ),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 5, color: Color.fromRGBO(151, 151, 151, .3), style: BorderStyle.solid)
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(userName != null) return;
                        Navigator.pushNamed(context, '/phone');
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(userName == null ? '登录/注册' : userName, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                      )
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/setting');
                        },
                        child: Container(
                          height: 62,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none)
                          ),
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