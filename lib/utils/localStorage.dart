import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static void setInstalledStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('installedStatus', status);
  }

  static Future<bool?> getInstalledStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('installedStatus') ?? false;
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