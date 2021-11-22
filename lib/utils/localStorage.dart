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

  static void setMobileNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('mobile', number);
  }

  static Future<String?> getMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('mobile') ?? '';
  }

  static void clearPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}