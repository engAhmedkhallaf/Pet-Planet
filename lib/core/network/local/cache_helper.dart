import 'package:shared_preferences/shared_preferences.dart';

// Cache Helper
class CacheHelper {
  static late SharedPreferences sharedPreferences;

  // Init Cache .
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Store Data to Local Database by Key
  static Future<bool> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

// Get Data saved in Local Database
  static dynamic get({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  // Remove Data By Key
  static Future<bool> removeData({required key}) async {
    return await sharedPreferences.remove(key);
  }

  // Clear All Data in the Local Database
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
