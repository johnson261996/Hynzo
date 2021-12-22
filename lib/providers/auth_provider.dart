///Authentication provider for Login and otp verification screen
///
///
import 'dart:async' show Future;

import 'package:flutter/foundation.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/core/services/auth/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  late String userMobile = "";
  late String otpId = "";
  late String userName = "";

  void changeLoadingStatus(bool loading) {
    Future.delayed(const Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<GenerateOTPModel> generateOTP(
      String mobile, String name, String signature) async {
    final GenerateOTPModel response =
        await AuthService.generateOTP(mobile, name, signature);
    userMobile = mobile.toString();
    otpId = response.otpVerificationId.toString();
    userName = name;
    notifyListeners();
    return response;
  }

  Future<GenerateOTPModel> resendOtp(
      String mobile, String name, String signature) async {
    final GenerateOTPModel response =
        await AuthService.generateOTP(mobile, name, signature);
    userMobile = mobile.toString();
    otpId = response.otpVerificationId.toString();
    userName = name;
    notifyListeners();
    return response;
  }

  Future<LoginModel> verifyOtp(String mobile, String name, String code,
      String otp_id, String otp) async {
    final LoginModel response =
        await AuthService.verifyOTP(mobile, name, code, otp_id, otp);
    notifyListeners();
    return response;
  }
}
