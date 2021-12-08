import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/providers/game_provider.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/connectivity.dart';
import 'package:hynzo/utils/localstorage.dart';
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
  List<SuggestedPlayModel> allSuggestedGames = [];
  late String token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gamesProvider = Provider.of<GamesProvider>(context, listen: false);
    allSuggestedGames.clear();
    // ConnectionStaus().check().then((connectionStatus) {
    //   if (connectionStatus) {
    getSuggestionGames();
    //   } else {
    //     ToastUtil().showToast(
    //         "No internet connection available. Please check your connection or try again later.");
    //   }
    // });
  }

  Future<void> getSuggestionGames() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await LocalStorage.getLoginStatus().then((value) => token = value!);
      SuggestedGamesResponseModel suggestedGamesResponseModel =
          await _gamesProvider!.getSuggestedGames(token);
      setState(() {
        _isLoading = false;
      });
      if (suggestedGamesResponseModel.statusCode == 200) {
        for (var element in suggestedGamesResponseModel.allSuggestedGames!) {
          allSuggestedGames.add(element);
        }
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: GameWidget(
        allSuggestedGames: allSuggestedGames,
      ),
    );
  }
}
