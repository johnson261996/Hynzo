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
}
