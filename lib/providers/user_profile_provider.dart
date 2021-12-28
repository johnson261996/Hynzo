///Provider for getting user details

import 'package:flutter/material.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/core/services/user_profile_service.dart';
import 'package:hynzo/utils/localstorage.dart';

class UserProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  late UserProfileModel userProfileModel = UserProfileModel();

  void changeLoadingStatus(bool loading) {
    Future.delayed(Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<UserProfileModel> getUser(int id) async {
    final UserProfileModel response = await UserProfileService.getUser(id);
    userProfileModel = response;
    notifyListeners();
    return response;
  }

  void setUserProfileDetails(UserProfileModel details) {
    userProfileModel = details;
    notifyListeners();
  }
}
