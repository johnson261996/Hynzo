///service created for getting user profile details
///
import 'dart:convert';

import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';

class UserProfileService {
  static Future<UserProfileModel> getUser(int id) async {
    String? token = await LocalStorage.getLoginToken();
    String url = 'api/v1/users/profiles/$id';

    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return UserProfileModel.fromJson(
        jsonDecode(response.body), response.statusCode);
  }
}
