import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart' as prefs;
/* Define Shared prefrence Singleton Pattern */

class PreferenceUtils {
  static Future<prefs.SharedPreferences> get _instance async =>
      _prefsInstance = await prefs.SharedPreferences.getInstance();
  static prefs.SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<prefs.SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

 
  
}
