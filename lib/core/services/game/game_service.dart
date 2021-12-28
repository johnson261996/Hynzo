import 'dart:convert';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/game_suggestion.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';

class GameService {
  static Future<GameSuggestionModel> getSuggestedGames() async {
    String token = "";
    await LocalStorage.getLoginToken().then((value) => token = value!);

    String url = 'api/v1/games/popular';
    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return GameSuggestionModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

  static Future<GamesResponseModel> getGames() async {
    String token = "";
    await LocalStorage.getLoginToken().then((value) => token = value!);

    String url = 'api/v1/games/all';
    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return GamesResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

  static Future<FilteredGamesResponseModel> getFilteredGames(
      String categ) async {
    String token = "";
    await LocalStorage.getLoginToken().then((value) => token = value!);
    String url = 'api/v1/games/filtered/$categ';

    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return FilteredGamesResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }
}
