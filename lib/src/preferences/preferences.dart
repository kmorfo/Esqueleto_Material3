import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static bool _darkTheme = false;

  static Future initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get darkTheme {
    return _preferences.getBool('dark') ?? false;
  }

  static set darkTheme(bool value) {
    _darkTheme = value;
    _preferences.setBool('dark', _darkTheme);
  }
}
