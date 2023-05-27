import 'package:shared_preferences/shared_preferences.dart';

class LoginManager {
  static const String isLoggedInKey = 'isLoggedIn';

  Future<void> setLoggedIn(bool isLoggedIn) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(isLoggedInKey, isLoggedIn);
  }

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isLoggedInKey) ?? false;
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove(isLoggedInKey);
  }
}
