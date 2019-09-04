import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

final GetIt getIt = GetIt.instance;
void setupLocator(){
  getIt.registerSingleton(NavigateService());
}

class NavigateService {
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  NavigatorState get navigator => key.currentState;

  get pushNamed => navigator.pushNamed;
  get pushReplacementNamed => navigator.pushReplacementNamed;
  get pushNamedAndRemoveUntil => navigator.pushNamedAndRemoveUntil;
  get popAndPushNamed => navigator.popAndPushNamed;
  get push => navigator.push;
}