import 'dart:async' show Future;
import 'package:flutter/foundation.dart';
import 'package:invent_chat/core/models/auth_model.dart';
import 'package:invent_chat/core/services/auth/auth_service.dart';
// import 'package:invent_chat/core/models/auth_model.dart';
// import 'package:invent_chat/core/services/news/news_services.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = true;

  void changeLoadingStatus(bool loading) {
    Future.delayed(const Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<GenerateOTPModel> generateOTP(String mobile, String signature) async {
    final GenerateOTPModel response =
        await AuthService.generateOTP(mobile, signature);
    isLoading = false;
    notifyListeners();
    return response;
  }
Future<LoginModel> verifyOtp(String mobile,String code,String otp_id,String otp) async{
  final LoginModel response =
      await AuthService.verifyOTP(mobile,code,otp_id,otp);
  isLoading = false;
  notifyListeners();
  return response;
}
  // void generateOTP(mobile) async {
  // final NewsModel response = await NewsService().fetchNews(page);
  // if (newsData != null && newsData!.articles != null) {
  //   newsData!.articles!.addAll(response.articles!);
  // } else {
  //   newsData = response;
  // }
  //   isLoading = false;
  //   notifyListeners();
  // }
}
