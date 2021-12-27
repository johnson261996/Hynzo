///service created for updating user profile

import 'dart:convert';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:http/http.dart' as http;

class UpdateProfileService {
  Future<UserProfileModel> update(String fullName, String mobile, String gender,
      String gender_detail, String dob, String avatar) async {
    int? id = await LocalStorage.getUserID();
    String? token = await LocalStorage.getLoginToken();
    String url = 'api/v1/users/profiles/$id/';
    String apiUrl = ServiceBase.apiBaseUrl + url;
    var headers = {
      "Content-Type": 'multipart/form-data',
      "Authorization": 'Bearer $token'
    };
    var request = http.MultipartRequest('PATCH', Uri.parse(apiUrl));
    request.fields.addAll({
      'full_name': fullName,
      'contact_number': mobile,
      'gender': gender,
      'gender_detail': gender_detail,
      'dob': dob,
      'avatar': avatar
    });
    print('data ${request.fields}');
    request.headers.addAll(headers);

    var streamResponse = await request.send();
    var res = await http.Response.fromStream(streamResponse);
    print(res.body);
    return UserProfileModel.fromJson(jsonDecode(res.body), res.statusCode);
  }
}
