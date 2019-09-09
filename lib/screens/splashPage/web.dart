import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
class WebPage extends StatefulWidget {
  final String url;
  final String fromPage;
  // final String title;
  WebPage({Key key, @required this.url, @required this.fromPage}) : super(key: key);
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  WebViewController controller;
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          child: GestureDetector(
            onTap: (){
              if(widget.fromPage == 'guide') {
                Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => route == null);
              } else {
                Navigator.pop(context);
              }
            },
            child: Image.asset('assets/images/phonepage/login-close.png', width: 3, height: 3, fit: BoxFit.cover),
          )
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (web){
            controller = web;
            web.currentUrl().then((url){
              print(url);// 返回当前url
            });
            // controller.evaluateJavascript("window.document.title").then((result){
            //   print(result);
            //   setState(() {
            //     title = result;
            //   });
            // });
          },
          onPageFinished: (String value) {
            controller.evaluateJavascript("document.title").then((result){
              print('###########');
              print(result);
              setState(() {
                title = result;
              });
            });
            controller.evaluateJavascript('window.isLogin = true').then((result){
              print(result);
            });
          },
          navigationDelegate: (NavigationRequest request) {
            if(request.url.startsWith("myapp://")) {
              print("即将打开 ${request.url}");
              
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
              name: "share",
              onMessageReceived: (JavascriptMessage message) {
                
                print(message.message);
                var a = convert.jsonDecode(message.message);
                if (a['type'] == 'showToast') {
                  Fluttertoast.showToast(msg: 'js调用flutter参数id${a['params']['id']}', toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIos: 1,backgroundColor: Color.fromRGBO(0, 0, 0, .5),textColor: Colors.white,fontSize: 16.0);
                } else if(a['type'] == 'router') {
                  Navigator.pushNamed(context, a['params']['page']);
                }
              }
            ),
          ].toSet(),
            
        ),
      )
    );
  }
}