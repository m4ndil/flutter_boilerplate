import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userKey = '';

  // Save user session
  static Future<void> saveUserSession(String userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userData);
  }

  // Get user session
  static Future<String?> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  // Remove user session (Logout)
  static Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
