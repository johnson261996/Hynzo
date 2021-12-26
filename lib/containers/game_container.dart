import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/providers/game_provider.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/game/game.dart';
import 'package:provider/provider.dart';

class GameContainer extends StatefulWidget {
  const GameContainer({Key? key}) : super(key: key);

  @override
  State<GameContainer> createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {
  static GamesProvider? _gamesProvider;
  bool _isLoading = false;
  List<GamePlayModel> allSuggestedGames = [];
  List<GamePlayModel> recentGames = [];
  List<GamePlayModel> allGames = [];
  List<GamePlayModel> popularGames = [];
  List<GamePlayModel> filteredGames = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gamesProvider = Provider.of<GamesProvider>(context, listen: false);
    allSuggestedGames.clear();
    recentGames.clear();
    allGames.clear();
    popularGames.clear();
    filteredGames.clear();

    //getFilteredGamesGames();
    getGames();
  }

  Future<void> getGames() async {
    try {
      setState(() {
        _isLoading = true;
      });
      GamesResponseModel gamesResponseModel =
      await _gamesProvider!.getGames();
      setState(() {
        _isLoading = false;
      });
      if (gamesResponseModel.statusCode == 200) {
        recentGames = gamesResponseModel.recentGames!;
        allGames = gamesResponseModel.allGames!;
        popularGames = gamesResponseModel.popularGames!;
      } else {
        ToastUtil().showToast("Something went wrong.2");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<FilteredGamesResponseModel> getFilteredGames(String categ)async{
    FilteredGamesResponseModel filteredResponseModel =
        await _gamesProvider!.getFilteredGames(categ);
    return filteredResponseModel;
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: GameWidget(
        allSuggestedGames: popularGames,
        recentlyPlayedGames: recentGames,
        allGames: allGames,
        popularGames: popularGames,
        filteredGames: getFilteredGames,
      ),
    );
  }
}
