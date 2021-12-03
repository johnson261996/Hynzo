import 'package:flutter/material.dart';
import 'package:hynzo/core/models/suggestion_model.dart';
import 'package:hynzo/core/services/suggestion/suggestion_service.dart';

class SuggestionProvider extends ChangeNotifier{

  Future<SuggestionModel> getSuggestionList(String token) async {
    final SuggestionModel response = await SuggestionService.getAllSuggestion(token);
    notifyListeners();
    return response;
  }

  Future<SuggestUserAddResponseModel> addSuggestUser(String token,List<String> userId) async {
    final SuggestUserAddResponseModel suggestUserAddResponseModel = await SuggestionService.addSuggestedUser(token, userId);
    notifyListeners();
    return suggestUserAddResponseModel;
  }

}