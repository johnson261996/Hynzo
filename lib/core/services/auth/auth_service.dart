import 'dart:async' show Future;
import 'dart:convert';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/core/services/service_base.dart';

class AuthService {
  static Future<GenerateOTPModel> generateOTP(mobile, signature) async {
    String url = 'api/v2/users/generate_otp';
    Map data = {
      'contact_number': mobile,
      'phone_code': '91',
      'signature': signature,
    };
    var response = await ServiceBase.post(
        url: url, data: data, headers: {"Content-Type": "application/json"});
    return GenerateOTPModel.fromJson(
        jsonDecode(response.body), response.statusCode);
  }

  static Future<LoginModel> verifyOTP(mobile, code, otp_id, otp) async {
    Map data = {
      'contact_number': mobile,
      'phone_code': '91',
      'otp_verification_id': otp_id,
      'otp': otp,
    };
    String url = 'api/v2/users/verify_otp';
    var response = await ServiceBase.post(
        url: url, data: data, headers: {"Content-Type": "application/json"});
    print(response.body);
    return LoginModel.fromJson(jsonDecode(response.body), response.statusCode);
  }
}
