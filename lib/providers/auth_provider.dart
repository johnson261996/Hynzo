///Authentication provider for Login and otp verification screen
///
///

import 'dart:async' show Future;
import 'package:flutter/foundation.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/core/services/auth/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = true;
  late String userMobile = "";
  late String otpId = "";

  void changeLoadingStatus(bool loading) {
    Future.delayed(const Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<GenerateOTPModel> generateOTP(String mobile, String signature) async {
    final GenerateOTPModel response =
        await AuthService.generateOTP(mobile, signature);
    userMobile = mobile.toString();
    otpId = response.otpVerificationId.toString();
    isLoading = false;
    notifyListeners();
    return response;
  }

  Future<LoginModel> verifyOtp(
      String mobile, String code, String otp_id, String otp) async {
    final LoginModel response =
        await AuthService.verifyOTP(mobile, code, otp_id, otp);
    isLoading = false;
    notifyListeners();
    return response;
  }
}
