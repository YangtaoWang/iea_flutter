import 'package:flutter/material.dart';
import 'package:iea/screens/splashPage/firstPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/index.dart';
import 'package:iea/redux/appState.dart';
import 'package:iea/router/index.dart';
// import 'package:iea/redux/AppState.dart';
// import 'package:iea/redux/AppReducer.dart';
// import 'package:iea/redux/reducer.dart';
// import 'dart:developer';
// import 'package:iea/redux/appActions.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  // store.dispatch(LoginSuccessAction(token: 'new asfasfasfToken'));
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white
        ),
        home: FirstPage(),
        routes: routes,
      )
    );
  }
}

