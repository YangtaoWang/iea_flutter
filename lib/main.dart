import 'package:flutter/material.dart';
import 'package:iea/screens/minepage/mine_screen.dart';
// import 'package:iea/screens/goodDetailPage/goodDetai_page.dart';
import 'package:iea/screens/splashPage/firstPage.dart';
import 'package:iea/screens/test/testPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iea/redux/index.dart';
import 'package:iea/redux/appState.dart';
import 'package:iea/router/index.dart';
// import 'package:iea/screens/openDetailPage/openDetail_page.dart';
// import 'package:iea/redux/AppState.dart';
// import 'package:iea/redux/AppReducer.dart';
// import 'package:iea/redux/reducer.dart';
// import 'dart:developer';
// import 'package:iea/redux/appActions.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:iea/sp/index.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'dart:convert' as convert;
import 'package:iea/utils/service_locator.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
// import 'package:iea/screens/test/testPage.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:http/http.dart' as http;

// import 'models/loginPage_models/iosDeviceInfo_model.dart';


void main() async{
  // store.dispatch(LoginSuccessAction(token: 'new asfasfasfToken'));
  setupLocator();
  // _initJPush();
  initPlatformState();
  await readFont('https://xszx-test-1251987637.cos.ap-beijing.myqcloud.com/SourceHanSerifCN-SemiBold.otf');
  runApp(MyApp(store));
}
// 自定义字体加载
Future<void> readFont(String path) async {
  var fontLoader = FontLoader("Montserrat");
  fontLoader.addFont(fetchFont(path));
  await fontLoader.load();
}
Future<ByteData> fetchFont(path) async {
  final response = await http.get(path);
  if (response.statusCode == 200) {
    return ByteData.view(response.bodyBytes.buffer);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load font');
  }
}

Future<void> initPlatformState() async {
  JPush jpush = new JPush();
  jpush.setAlias("iostest").then((map) {
    print('--------别名设置成功-----');
  });
  jpush.getRegistrationID().then((rid) {
    print("rid--------$rid");
  });
  jpush.setup(
    appKey: "2d1c44f2ec1d576aa9ec7d29",
    channel: "developer-default",
    production: false,
    debug: true,
  );
  jpush.applyPushAuthority(new NotificationSettingsIOS(sound: true, alert: true, badge: true));
  try {
    jpush.addEventHandler(
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
  } on Exception {      
    print("Failed to get platform version");
  }
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
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
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
        home: TestPage(),
        // home: FirstPage(),
        routes: routes,
      )
    );
  }
}

