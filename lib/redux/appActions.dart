enum AppActions{
  Increase,
  Login,
  LoginSuccess,
  LogoutSuccess
}

/// 定义所有action的基类
class Action{
  final AppActions type;
  Action({this.type});
}

/// 定义Login成功action, 需要外部传参
class LoginSuccessAction extends Action{
  final String token;
  LoginSuccessAction({this.token}) : super(type: AppActions.LoginSuccess);
}