import 'package:flutter/material.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/core/services/interest/interest_service.dart';

class InterestProvider extends ChangeNotifier {
  bool isLoading = false;

  void changeLoadingStatus(bool loading) {
    Future.delayed(Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<InterestResponseModel> getInterestList(
      String limit, String offset) async {
    final InterestResponseModel response =
        await InterestService.getAllInterest(limit, offset);
    notifyListeners();
    return response;
  }

  Future<bool> createUserInterest(String interestIds) async {
    final bool response = await InterestService.createUserInterest(interestIds);
    return response;
  }
}
