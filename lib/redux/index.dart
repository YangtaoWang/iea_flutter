 import 'appState.dart';
 import 'package:redux/redux.dart';
 import 'appReducer.dart';
 import 'stateModule/countState.dart';
 import 'stateModule/authState.dart';
 import 'appMiddleWare.dart';
 Store<AppState> store = new Store<AppState>(appReducer, initialState: new AppState(
    count: new CountState(),
    auth: new AuthState(),
  ), middleware: [loggingMiddleware]
  );