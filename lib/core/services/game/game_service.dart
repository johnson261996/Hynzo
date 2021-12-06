import 'dart:convert';

import 'package:hynzo/core/models/all_games_model.dart';

import '../service_base.dart';

class GameService{
  static Future<SuggestedGamesResponseModel> getSuggestedGames(String token) async {
    String url = 'api/v1/games/fetch';
    var response = await ServiceBase.get(
        url: url, headers: {"Content-Type": "application/json","Authorization":"Bearer $token"});
    if(response.statusCode != 200){
      throw "Something went wrong";
    }
    return SuggestedGamesResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }
}