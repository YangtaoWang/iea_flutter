import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
class WebViewPage extends StatefulWidget {
  WebViewPage({Key key}) : super(key: key);

  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://baidu.com",
      appBar: new AppBar(
        title: new Text("IEA官网", style: TextStyle(color: Colors.black, fontSize: 20),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
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