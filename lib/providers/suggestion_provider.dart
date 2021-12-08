import 'package:flutter/material.dart';
import 'package:hynzo/core/models/suggestion_model.dart';
import 'package:hynzo/core/services/suggestion/suggestion_service.dart';

class SuggestionProvider extends ChangeNotifier {
  Future<SuggestionModel> getSuggestionList() async {
    final SuggestionModel response = await SuggestionService.getAllSuggestion();
    notifyListeners();
    return response;
  }

  Future<SuggestUserAddResponseModel> addSuggestUser(
      List<String> userId) async {
    final SuggestUserAddResponseModel suggestUserAddResponseModel =
        await SuggestionService.addSuggestedUser(userId);
    notifyListeners();
    return suggestUserAddResponseModel;
  }
}
