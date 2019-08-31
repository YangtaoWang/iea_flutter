import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
class WebViewPage extends StatefulWidget {
  final String url;
  WebViewPage({Key key, @required this.url}) : super(key: key);
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: new AppBar(
        title: new Text("IEA官网", style: TextStyle(color: Colors.black, fontSize: 22),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            },
            child: Container(
              width: 35,
              height: 15,
              margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Image.asset('assets/images/openDetail/actionsHome.png', width: 35, height: 15, fit: BoxFit.fill),
            )
          )
        ],
        leading: Container(
          child: GestureDetector(
            onTap: (){Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => route == null);},
            child: Image.asset('assets/images/phonepage/login-close.png', width: 3, height: 3, fit: BoxFit.cover),
          )
        ),
      )
    );
  }
}