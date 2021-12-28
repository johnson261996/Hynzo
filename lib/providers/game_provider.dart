import 'package:flutter/cupertino.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/services/game/game_service.dart';

class GamesProvider extends ChangeNotifier {
  Future<SuggestedGamesResponseModel> getSuggestedGames() async {
    final SuggestedGamesResponseModel response =
        await GameService.getSuggestedGames();
    notifyListeners();
    return response;
  }

  Future<GamesResponseModel> getGames() async {
    final GamesResponseModel response = await GameService.getGames();
    notifyListeners();
    return response;
  }

  Future<FilteredGamesResponseModel> getFilteredGames(String categ) async {
    final FilteredGamesResponseModel response =
        await GameService.getFilteredGames(categ);
    notifyListeners();
    return response;
  }
}
