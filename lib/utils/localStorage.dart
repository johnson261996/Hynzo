import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static void setIntroStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('introStatus', status);
  }

  static Future<bool?> getIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('introStatus') ?? true;
  }


  static void setLoginToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getLoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";
  }

  static void setMobileNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('mobile', number);
  }

  static Future<String?> getMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('mobile') ?? "";
  }

  static void clearPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void clearToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static void clearMobileNumber() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('mobile');
  }

}