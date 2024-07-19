import 'package:flutter/cupertino.dart';

class WidgetHelpers {
  static void hideKeyboard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }
}
