import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Bool
  static Future<void> setBool(
      {required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  //! String
  static Future<void> setString(
      {required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Int
  static Future<void> setInt({required String key, required int value}) async {
    await sharedPreferences.setInt(key, value);
  }

  static int? getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  //! Double
  static Future<void> setDouble(
      {required String key, required double value}) async {
    await sharedPreferences.setDouble(key, value);
  }

  static double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }
}
