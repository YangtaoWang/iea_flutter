/// 这个类用来管理登录状态
class AuthState{    //是否登录
  bool isLogin; 
  String token;   //用户名
  AuthState({this.isLogin: false, this.token: 'init'});
}