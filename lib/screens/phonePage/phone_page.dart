
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/provider/resource/phonepage_api_provider.dart';
import 'package:iea/provider/base/base_resp.dart';
import 'package:iea/screens/loginPage/login_page.dart';

class PhonePage extends StatefulWidget {
  PhonePage({Key key}) : super(key: key);

  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  TextEditingController controller = TextEditingController();
  bool isChange = false;
  RegExp mobile = new RegExp(r"1[3|4|5|6|7|8|9|]\d{9}$");
  _getCode(phone) async {
    Map<String, String>  params = {'phone': phone};
    BaseResp data = await PhonePageApiProvider().getCode(params);
    return data;
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          child: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Image.asset('assets/images/phonepage/login-close.png', width: 3, height: 3, fit: BoxFit.cover),
          )
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text('登录/注册', style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.w500))
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 41,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 0.3, style: BorderStyle.solid))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5, bottom: 4),
                        child: Image.asset('assets/images/phonepage/login-phone.png', width: 15, height: 15, fit: BoxFit.cover,),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: controller,
                          onChanged: (text) {
                            setState(() {
                              isChange = controller.text.length == 11;
                            });
                          },
                          inputFormatters:<TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: '请输入手机号',
                            hintStyle: TextStyle(color: Color.fromRGBO(102, 102, 102, .5), fontSize: 15),
                            border: InputBorder.none
                          )
                        ),
                      )
                    ],
                  )  
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/phonepage/login-success.png', width: 14, height: 14, fit: BoxFit.cover,),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Row(
                          children: <Widget>[
                            Text('登录代表同意', style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1))),
                            GestureDetector(
                              onTap: () {},
                              child: Text('《IEA认证用户协议》', style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 12)),
                            ),  
                            Text('和', style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1))),
                            GestureDetector(
                              onTap: (){},
                              child: Text('《隐私政策》', style: TextStyle(color: Color.fromRGBO(243, 110, 34, 1), fontSize: 12)),
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    if (!isChange) return;
                    if (mobile.hasMatch(controller.text)) {
                      BaseResp res = await _getCode(controller.text);
                      if (res.code == 200) {
                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context){
                          return LoginPage(phone: controller.text);
                        }));
                      } else {
                        Fluttertoast.showToast(msg: "验证码发送失败，请重试",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                      }
                    } else {
                      Fluttertoast.showToast(msg: "手机号格式有误",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 240),
                    height: 50,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      color: !isChange ? Color.fromRGBO(243, 110, 34, .4) : Color.fromRGBO(243, 110, 34, 1),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text('获取验证码', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                  )
                )
              ],
            ),
          )
        ),
      )
    );
  }
}