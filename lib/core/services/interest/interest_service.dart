import 'dart:convert';

import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';

class InterestService {
  static Future<InterestResponseModel> getAllInterest(
      String limit, String offset) async {
    String token = "";
    await LocalStorage.getLoginToken().then((value) => token = value!);
    String url = 'api/v1/users/interests/list?limit=$limit&offset=$offset';
    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return InterestResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

  static Future<bool> createUserInterest(String interestIds) async {
    String token = "";
    await LocalStorage.getLoginToken().then((value) => token = value!);

    String url = 'api/v1/users/interests/create';
    Map data = {
      'user_interests': interestIds,
    };
    var response = await ServiceBase.post(url: url, data: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode != 201) {
      throw "Something went wrong";
    }
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
