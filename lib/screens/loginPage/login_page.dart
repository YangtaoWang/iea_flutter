import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iea/provider/resource/phonepage_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/provider/resource/loginpage_api_provider.dart';
import 'package:iea/sp/index.dart';
import 'dart:convert' as convert;

class LoginPage extends StatefulWidget {
  final String phone;
  LoginPage({Key key, @required this.phone}) : super(key: key);
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();
  String code = '';
  int clock = 60;
  bool isClock = true;
  Timer timer;
  bool isOk = true;
  _startClock () { // 开启定时器
    setState(() {isClock = true;});
    int time = 60;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {clock = time;});
      time --;
      if (time < 0) {
        timer.cancel();
        setState(() {
          isClock = false;
          clock = 60;
        });
      }
    });
  }
  _getCode(phone) async {
    Map<String, String>  params = {'phone': phone};
    BaseResp data = await PhonePageApiProvider().getCode(params);
    return data;
  }
  _login(String phone, String code) async {
    Map<String, String>  params = {'phone': phone, 'code': code, 'deviceType': '3', 'loginType': '2' };
    BaseResp data = await LoginPageApiProvider().login(params);
    return data;
  }
  @override 
  void initState() {
    _startClock();
    super.initState();
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text('输入验证码', style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.w500))
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Text('验证码已发送至：', style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1))),
                      Text('+86 ' + widget.phone.substring(0, 3) + ' ' + widget.phone.substring(3, 7) + ' ' + widget.phone.substring(7), style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 12))
                    ],
                  ),
                ),
                Container(
                  height: 41,
                  margin: EdgeInsets.only(top: 78),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 40,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1, style: BorderStyle.solid))
                              ),
                              child: Text(code.length >= 1 ? code[0] : '', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              width: 40,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1, style: BorderStyle.solid))
                              ),
                              child: Text(code.length >= 2 ? code[1] : '', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              width: 40,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1, style: BorderStyle.solid))
                              ),
                              child: Text(code.length >= 3 ? code[2] : '', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              width: 40,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1, style: BorderStyle.solid))
                              ),
                              child: Text(code.length >= 4 ? code[3] : '', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              width: 40,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1, style: BorderStyle.solid))
                              ),
                              child: Text(code.length >= 5 ? code[4] : '', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              width: 40,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1, style: BorderStyle.solid))
                              ),
                              child: Text(code.length >= 6 ? code[5] : '', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                            )
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 1,
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          controller: controller,
                          onChanged: (text) async{
                            if(code.length < 6 && controller.text.length == 6){
                              setState(() {
                                code = controller.text;
                              });
                              print('发送请求');
                              BaseResp res = await _login(widget.phone, controller.text);
                              if (res.code == 200) {
                                Fluttertoast.showToast(msg: "登录成功",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                                print(res.data);
                                SP().saveData('userInfo', convert.jsonEncode(res.data));
                                Navigator.of(context).pop('asfafdsa');
                              } else {
                                setState(() {isOk = false;});
                              }
                            }
                            setState(() {
                              code = controller.text;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请输入6位短信验证码',
                            hintStyle: TextStyle(fontSize: 15, color: Color.fromRGBO(102, 102, 102, .4)),
                            counterText: ''
                          ),
                          maxLength: 6,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.transparent
                          ),
                        )
                      )
                    ],
                  ),
                ),
                Opacity(
                  opacity: isOk ? 0 : 1,
                  child: Container(
                  margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/images/loginpage/warn.png', width: 12, height: 12, fit: BoxFit.cover,),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text('验证码错误', style: TextStyle(fontSize: 12, color: Color.fromRGBO(255, 0, 25, 1))),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Row(
                    children: <Widget>[
                      Text('没收到验证码？', style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, .4))),
                      Offstage(
                        offstage: !isClock,
                        child: Text.rich(TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '$clock' + 's',
                              style: TextStyle(fontSize: 12, color: Color.fromRGBO(243, 110, 34, 1))
                            ),
                            TextSpan(
                              text: ' 以后可重新发送',
                              style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, .4))
                            )
                          ]
                        )),
                      ),
                      GestureDetector(
                        onTap: () async {
                          BaseResp res = await _getCode(widget.phone);
                          if (res.code == 200) {
                            Fluttertoast.showToast(msg: "验证码发送成功",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                            _startClock();
                          } else {
                            Fluttertoast.showToast(msg: "验证码发送失败，请重试",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                          }
                        },
                        child: Offstage(
                          offstage: isClock,
                          child: Text('重新获取', style: TextStyle(fontSize: 12, color: Color.fromRGBO(243, 110, 34, 1)))
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      )
    );
  }
}