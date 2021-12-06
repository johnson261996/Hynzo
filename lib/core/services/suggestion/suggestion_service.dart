import 'dart:convert';
import 'package:hynzo/core/models/suggestion_model.dart';
import '../service_base.dart';

class SuggestionService {

  static Future<SuggestionModel> getAllSuggestion(String token) async {
    String url = 'api/v1/users/suggestions';
    var response = await ServiceBase.get(
        url: url, headers: {"Content-Type": "application/json","Authorization":"Bearer $token"});
    if(response.statusCode != 200){
      throw "Something went wrong";
    }
    return SuggestionModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

  static Future<SuggestUserAddResponseModel> addSuggestedUser(String token,List<String> userId) async {
    String url = 'api/v1/chats/create';

    Map data = {
      'participants' : userId,
      'is_group' : false,
    };
    var response = await ServiceBase.post(
        url: url, data : data,headers: {"Content-Type": "application/json","Authorization":"Bearer $token"});
    if(response.statusCode != 201){
      throw "Something went wrong";
    }
    return SuggestUserAddResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }


}