///service created for getting user profile details
///
import 'dart:convert';
import 'dart:developer';
import 'package:hynzo/core/models/settings_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';

class SettingsService {
  static Future<SettingsModel> getSettings() async {
    String? token = await LocalStorage.getLoginToken();
    String url = 'api/v1/users/mode/status';

    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return SettingsModel.fromJson(
        jsonDecode(response.body), response.statusCode);
  }

  static Future<Map<String, dynamic>> setSettings(bool nightMode,
      bool ghostMode, bool onlineMode, bool muteMode, bool msgReadMode) async {
    String? token = await LocalStorage.getLoginToken();
    log(token!);
    String url = 'api/v1/users/mode/switch';

    Map data = {
      "night_mode": '$nightMode',
      "ghost_mode": '$ghostMode',
      "online_mode": '$onlineMode',
      "mute_mode": '$muteMode',
      "msg_read_mode": '$msgReadMode',
    };
    var response = await ServiceBase.post(url: url, data: data, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return jsonDecode(response.body);
  }
}
