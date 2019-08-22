enum Actions{
  Increase,
  Login,
  LoginSuccess,
  LogoutSuccess
}

/// 定义所有action的基类
class Action{
  final Actions type;
  Action({this.type});
}

/// 定义Login成功action
class LoginSuccessAction extends Action{
  final String token;
  LoginSuccessAction({this.token}) : super(type: Actions.LoginSuccess);
}