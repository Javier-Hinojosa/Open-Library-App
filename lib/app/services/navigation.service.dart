import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  static Future<dynamic> navigateReplacementTo(String routeName, {Object? arguments}) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  static void goBack<T extends Object?>([T? result]) {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.pop(result);
    }
  }
}