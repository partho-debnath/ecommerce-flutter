import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;
  static const String _tokenKey = 'accessToken';

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String accessToken) async {
    await _saveAccessToken(accessToken);
    _accessToken = accessToken;
  }

  static Future<void> _saveAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, accessToken);
  }

  static Future<void> readAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString(_tokenKey);
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _accessToken = null;
  }
}
