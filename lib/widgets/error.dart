import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iea/utils/service_locator.dart';

class ErrorPage extends StatelessWidget {
  final String imgUrl;
  final errorCallback;
  int tokenNum;

  // ErrorPage({Key key,  this.imgUrl = 'assets/images/empty.png', this.errorCallback}) : super(key: key);
  ErrorPage({Key key,  this.imgUrl = '', this.tokenNum = 0, this.errorCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF6F6F6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(this.imgUrl),
              width: 150,
              height: 150,
            ),
            Container(
              width: 120,
              height: 44,
              margin: EdgeInsets.only(top: 20),
              child:
                RaisedButton(
                onPressed: (){
                  print('error-onPressed');
                  if(tokenNum == 401){
                    Fluttertoast.showToast(msg: "账号在其他设备登录，请重新登录",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Color.fromRGBO(255, 255, 255, 1),fontSize: 12.0);
                    getIt<NavigateService>().pushNamed('/phone');
                  } else {
                    this.errorCallback();
                  }
                },
                color: Color(0xFFffffff),//按钮的背景颜色
                child: new Text('重新加载'),
                textColor: Color(0xFFff6700),//文字的颜色
                textTheme:ButtonTextTheme.normal ,//按钮的主题
                onHighlightChanged: (bool b){//水波纹高亮变化回调
                },
                elevation: 10.0,//按钮下面的阴影
                highlightElevation: 10.0,//高亮时候的阴影
                disabledElevation: 10.0,//按下的时候的阴影
//              shape:,//设置形状  LearnMaterial中有详解
              )
            )
          ],
        ),
      );
  }
}

class ErrorInfo{
  final String imgUrl;
  final String msg;
  final Function errorCallback;
  ErrorInfo(this.imgUrl, this.msg, this.errorCallback);
}