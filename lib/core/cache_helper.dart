import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPrefer;
  static Future cacheInitialation() async {
    sharedPrefer = await SharedPreferences.getInstance();
  }

  static Future<bool> setCacheData(
      {required String key, required String value}) async {
    return await sharedPrefer.setString(key, value);
  }

  static String getCacheData({
    required String key,
  }) {
    return sharedPrefer.getString(key) ?? '';
  }
}
