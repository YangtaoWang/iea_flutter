import 'package:iea/redux/module1/action.dart';
import 'package:iea/redux/module1/state.dart';

CountState reducer(CountState state, action) {
  //匹配Action
  if (action == Action.increment) {
    state.count += 1;
  }
  return state;
}