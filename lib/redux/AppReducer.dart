import 'AppState.dart';
import './module1/reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
  new AppState(
    countState: reducer(state.countState, action)
  );