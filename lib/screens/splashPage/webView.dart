import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WebViewPage extends StatefulWidget {
  final String url;
  WebViewPage({Key key, @required this.url}) : super(key: key);
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var title = "WebView组件";
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }
  // void handleJs() {
  //   flutterWebviewPlugin.evalJavascript("abc(${title})").then((result) {

  //   });
  // }
  //获取h5页面标题
  // getWebTitle() async {
  //   String script = 'window.document.title';
  //   var title = await flutterWebviewPlugin.evalJavascript(script);
  //   setState(() {
  //     title = title;
  //     print('####################');
  //     print(title);
  //   });
  // }
  void handleJs() {
    flutterWebviewPlugin.evalJavascript("window.document.title").then((result) {
      setState(() {
        title = result;
      });
    });
  }
   //获取h5页面标题
  getWebTitle2({String url}) async {
    var client = http.Client();
    client
        .get(url)
        .then(
            (response) {
          String title = RegExp(
              r"<[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}(\s.*)?>([^<]*)</[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}>")
              .stringMatch(response.body);
          if (title != null) {
            title =
                title.substring(title.indexOf('>') + 1, title.lastIndexOf("<"));
          } else {
            title = "";
          }
          print("####################  " + title);
        })
        .catchError(
            (error) {
          print(error);
        })
        .whenComplete(client.close,);
  }
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) { 
      print(offsetY.toString());
    });
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged webViewState) async {
//      setState(() {
//        title = webViewState.type.toString();
//      });
      switch (webViewState.type) {
        case WebViewState.finishLoad:
          handleJs();
          getWebTitle2(url: widget.url);
          print('finishLoad');
          break;
        case WebViewState.shouldStart:
          print('shouldStart');
          break;
        case WebViewState.startLoad:
          print('startLoad');
          break;
        case WebViewState.abortLoad:
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      // url: 'http://ieaorg.org',
      hidden: true,
      withZoom: true,
      withLocalStorage: true,
      appBar: new AppBar(
        title: new Text(title, style: TextStyle(color: Colors.black, fontSize: 22),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              flutterWebviewPlugin.close();
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