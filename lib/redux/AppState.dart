import 'package:iea/redux/stateModule/authState.dart';
import 'package:iea/redux/stateModule/countState.dart';
/// 应用程序状态
class AppState{
  AuthState auth;     //登录
  CountState count; //主页
  AppState({this.count,this.auth});
}