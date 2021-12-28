import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hynzo/core/services/home/home_service.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;

  void changeLoadingStatus(bool loading) {
    Future.delayed(Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<Map<String, dynamic>> setFcmToken(String token) async {
    final Map<String, dynamic> response =
        await HomeService().setFcmToken(token);
    log("FCM TOKEN : " + token);
    notifyListeners();
    return response;
  }
}
