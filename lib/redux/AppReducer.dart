import 'package:iea/redux/appState.dart';
import 'package:iea/redux/appActions.dart';
AppState appReducer(AppState state, dynamic action){
  print("state charge :$action ");
  if (action == Actions.Increase) {
    state.count.counter += 1;
  }
  if (action == Actions.LogoutSuccess){ 
    state.auth.isLogin = false;
    state.auth.token = null;
  }
  if(action is LoginSuccessAction){
    state.auth.isLogin = true;
    state.auth.token = action.token;
  }
  print("state changed:$state");
  return state;
}
