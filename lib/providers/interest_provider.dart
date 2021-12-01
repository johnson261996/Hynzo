import 'package:flutter/cupertino.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/core/services/interest/interest_service.dart';

class InterestProvider extends ChangeNotifier{

  Future<InterestResponseModel> getInterestList(String limit, String offset, String token) async {
    final InterestResponseModel response = await InterestService.getAllInterest(limit, offset,token);
    notifyListeners();
    return response;
  }

  Future<bool> createUserInterest(String interestIds, String token) async {
    final bool response = await InterestService.createUserInterest(interestIds,token);
    return response;
  }

}