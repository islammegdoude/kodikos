import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences;
  static inite() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // save any type of data 
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }
  
  // Data getters
  static Future<bool> saveBoolData({
    required String key,
    required bool value,
  })async{
    return await sharedPreferences.setBool(key, value);
  }
  static Future<bool> saveStringData({
    required String key,
    required String value,
  })async{
    return await sharedPreferences.setString(key, value);
  }
  static Future<bool> saveIntData({
    required String key,
    required int value,
  })async{
    return await sharedPreferences.setInt(key, value);
  }
  static Future<bool> saveDoubleData({
    required String key,
    required double value,
  })async{
    return await sharedPreferences.setDouble(key, value);
  }
  // get any tyle of data  
  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }
  // Data getters  
  static bool? getBoolData({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }
  static String? getStringData({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }
  static int? getIntData({
    required String key,
  }) {
    return sharedPreferences.getInt(key);
  }
  static double? getDoubleData({
    required String key,
  }) {
    return sharedPreferences.getDouble(key);
  }
  // remove data from shared 
  static Future<bool> removeData({
    required String key,
  })async {
    return await sharedPreferences.remove(key);
  }
}
