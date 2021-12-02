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

  static Future<String?> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";
  }

  static void setUserID(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', userId);
  }

  static Future<int?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId') ?? -1;
  }

  static void setUserName(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? "";
  }

  static void setUserFullName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fullname', name);
  }

  static Future<String?> getUserFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fullname') ?? "";
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

  static void clearUserID() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
  }

  static void clearUsername() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
  }

  static void clearUserFullName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('fullname');
  }

}