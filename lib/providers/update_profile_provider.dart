///Provider for updating user profile
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/core/services/update_profile_service.dart';

class UpdateProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  late UserProfileModel userProfile = UserProfileModel();

  void changeLoadingStatus(bool loading) {
    Future.delayed(Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<UserProfileModel> update(String fullName, String mobile, String gender,
      String gender_detail, String dob, String avatar) async {
    final UserProfileModel response = await UpdateProfileService()
        .update(fullName, mobile, gender, gender_detail, dob, avatar);
    userProfile = response;
    notifyListeners();
    return response;
  }
}
