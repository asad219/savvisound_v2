import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  late GlobalKey<NavigatorState> navigatorKey;

  void initialize() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  dynamic navigate(Widget widget) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  navigateReplace(Widget widget) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  navigateName(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  // Method to get current context
  BuildContext? get currentContext => navigatorKey.currentContext;
}
