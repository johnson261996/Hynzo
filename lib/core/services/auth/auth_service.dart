import 'dart:async' show Future;
import 'dart:convert';
import 'dart:developer';

import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/core/services/service_base.dart';

class AuthService {
  static Future<GenerateOTPModel> generateOTP(
      mobile, fullName, signature) async {
    String url = 'api/v2/users/generate_otp';
    Map data;
    if (fullName == '') {
      data = {
        'contact_number': mobile,
        'phone_code': '91',
        'signature': signature,
      };
    } else {
      data = {
        'contact_number': mobile,
        'phone_code': '91',
        'full_name': fullName,
        'signature': signature,
      };
    }
    var response = await ServiceBase.post(
        url: url, data: data, headers: {"Content-Type": "application/json"});
    log(response.body);
    return GenerateOTPModel.fromJson(
        jsonDecode(response.body), response.statusCode);
  }

  static Future<LoginModel> verifyOTP(
      mobile, fullName, code, otpId, otp) async {
    Map data = {
      'contact_number': mobile,
      'phone_code': '91',
      'otp_verification_id': otpId,
      'full_name': fullName,
      'otp': otp,
    };
    String url = 'api/v2/users/verify_otp';
    var response = await ServiceBase.post(
        url: url, data: data, headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return LoginModel.fromJson(jsonDecode(response.body), response.statusCode);
  }
}
