import 'package:flutter/material.dart';
import 'package:iea/screens/splashPage/firstPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/index.dart';
import 'package:iea/redux/appState.dart';
import 'package:iea/router/index.dart';
import 'package:iea/screens/openDetailPage/openDetail_page.dart';
// import 'package:iea/redux/AppState.dart';
// import 'package:iea/redux/AppReducer.dart';
// import 'package:iea/redux/reducer.dart';
// import 'dart:developer';
// import 'package:iea/redux/appActions.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:flutter/rendering.dart';
import 'package:iea/sp/index.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'dart:convert' as convert;
import 'package:iea/utils/service_locator.dart';

// import 'models/loginPage_models/iosDeviceInfo_model.dart';


void main() {
  // store.dispatch(LoginSuccessAction(token: 'new asfasfasfToken'));
  setupLocator();
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);
  final DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
  _getDeviceInfo() async{
    if(Platform.isIOS){
      //ios相关代码
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      // SP().getData('IosDeviceInfo');
      // SP().removeData('IosDeviceInfo');
      if(await SP().getData('DeviceInfo') == null) {
        Map<String, String> ios = {
          'deviceVersion': iosInfo.systemVersion,
          'deviceId': iosInfo.identifierForVendor,
          'deviceType': '2'
        };
        SP().saveData('DeviceInfo', convert.jsonEncode(ios));
      }
      
    }else if(Platform.isAndroid){
      //android相关代码
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      // SP().removeData('DeviceInfo');
      if(await SP().getData('DeviceInfo') == null) {
        Map<String, String> and = {
          'deviceVersion': androidInfo.version.toString(),
          'deviceId': androidInfo.device.toString(),
          'deviceType': '1'
        };
        SP().saveData('DeviceInfo', convert.jsonEncode(and));
      }
    }
  }
  // GlobalKey<NavigatorState> _navigatorKey = GlobalKey(debugLabel: 'navigate');
  @override
  Widget build(BuildContext context) {
    _getDeviceInfo();
    // debugPaintSizeEnabled = true;
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'iea_flutter',
        navigatorKey: getIt<NavigateService>().key,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white
        ),
        // home: OpenDetailPage(),
        home: FirstPage(),
        routes: routes,
      )
    );
  }
}

