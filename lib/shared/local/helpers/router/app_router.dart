import 'package:flutter/material.dart';
import 'package:progress_soft_app/main.dart';

class AppRouter {
  //route and  remove  the  Current screen
  static pushReplace({required Widget screen}) {
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

// route without remove anything
  static Future push({required Widget screen, bool maintainState = true}) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => screen,
        maintainState: maintainState,
      ),
    );
  }

// Route and Remove all All pages in the stack
  static removeUntil({required Widget screen}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }

// GO BACK
  static pop({dataToSendBack}) {
    return navigatorKey.currentState!.pop(dataToSendBack);
  }
}
