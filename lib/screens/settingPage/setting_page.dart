import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/provider/resource/settingPage_api_provider.dart';
import 'package:iea/sp/index.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isLogin = false;
  _getUserInfo() async{
    String res = await SP().getData('userInfo');
    if(res != null) {
      setState(() {
        isLogin = true;
      });
    }
  }
  _logout() async{
    BaseResp data = await SettingPageApiProvider().logout();
    return data;
  }
  _logoutClick() async{
    SP().removeData('userInfo');
    BaseResp data = await _logout();
    // if (data.code == 200) {
      Fluttertoast.showToast(msg: "退出登录成功",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
      
      Navigator.of(context).pop();
    // }
  }
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('设置', style: TextStyle(color: Colors.black, fontSize: 16)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1)
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 62,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('关于', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18)),
                        Row(
                          children: <Widget>[
                            Text('V1.2.0', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14)),
                            Image.asset('assets/images/mypage/arrowright.png', width: 15, height: 15, fit: BoxFit.cover,),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3, color: Color.fromRGBO(151, 151, 151, .3)))
                    ),
                  ),
                  Container(
                    height: 62,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('清除缓存', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 18)),
                        Text('38.98M', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Opacity(
              opacity: isLogin ? 1 : 0,
              child: GestureDetector(
                onTap: _logoutClick,
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  height: 62,
                  alignment: FractionalOffset.center,
                  child: Text('退出登录', style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 18)),
                )
              )
            )
          ],
        )
      )
    );
    
  }
}