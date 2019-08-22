import 'package:iea/redux/module1/state.dart';

class AppState {
  final CountState countState;
  AppState({
    this.countState
  });
  factory AppState.initial() {
    return AppState(
      countState: CountState.initState()
    );
  }
}