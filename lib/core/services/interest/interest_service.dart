import 'dart:convert';

import 'package:hynzo/core/models/interest_model.dart';

import '../service_base.dart';

class InterestService {

  static Future<InterestResponseModel> getAllInterest(
      String limit, String offset, String token) async {
    String url = 'api/v1/users/interests/list?limit=$limit&offset=$offset';
    var response = await ServiceBase.get(
        url: url, headers: {"Content-Type": "application/json","Authorization":"Bearer $token"});
    return InterestResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

  static Future<bool> createUserInterest(String interestIds, String token) async {
    String url = 'api/v1/users/interests/create';
    Map data = {
      'user_interests' : interestIds,
    };
    var response = await ServiceBase.post(
        url: url, data : data, headers: {"Content-Type": "application/json","Authorization":"Bearer $token"});
    if(response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }


  static Future<InterestResponseModel> getUserSpecificInterest(
      String limit, String offset) async {
    String url = 'api/v1/users/interests/list?limit=$limit&offset=$offset';
    var response = await ServiceBase.get(
        url: url, headers: {"Content-Type": "application/json"});
    return InterestResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

}
