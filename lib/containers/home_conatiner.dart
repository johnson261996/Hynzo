/// Contains service and logic related of home screen.
///
///
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/providers/game_provider.dart';
import 'package:hynzo/providers/news_provider.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatefulWidget {
  final Function _onTapped;

  const HomeContainer(this._onTapped, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer> {
  static NewsProvider? _newsProvider;
  static GamesProvider? _gamesProvider;
  List<NewsContentDataModel> allNews = [];
  List<SuggestedPlayModel> allSuggestedGames = [];
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsProvider = Provider.of<NewsProvider>(context, listen: false);
    _gamesProvider = Provider.of<GamesProvider>(context, listen: false);
    allNews.clear();
    // ConnectionStaus().check().then((connectionStatus) {
    //   if (connectionStatus) {
    getSuggestionGames();
    //   } else {
    //     ToastUtil().showToast(
    //         "No internet connection available. Please check your connection or try again later.");
    //   }
    // });
  }

  bool isToday(String time) {
    var now = DateTime.now();
    var formatter = DateFormat('MM/dd/yyyy');
    String currentDate = formatter.format(now);
    var newsdate = DateTime.parse(time);
    String newsDate = formatter.format(newsdate);
    if (currentDate.split("/")[1] == newsDate.split("/")[1]) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getSuggestionGames() async {
    try {
      setState(() {
        _isLoading = true;
      });
      SuggestedGamesResponseModel suggestedGamesResponseModel =
          await _gamesProvider!.getSuggestedGames();
      if (suggestedGamesResponseModel.statusCode == 200) {
        allSuggestedGames = suggestedGamesResponseModel.allSuggestedGames!;
        // for (var element in suggestedGamesResponseModel.allSuggestedGames!) {
        //   if (element.activeStatus!) {
        //     allSuggestedGames.add(element);
        //   }
        // }
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
      getAllNews();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<void> getAllNews() async {
    try {
      NewsResponseModel newsResponseModel = await _newsProvider!.getNewsList();
      setState(() {
        _isLoading = false;
      });
      if (newsResponseModel.statusCode == 200) {
        for (var element in newsResponseModel.newsDataList!) {
          for (var newsContent in element.newsDataContentList!) {
            if (isToday(newsContent.pubDate!)) {
              if (allNews.length < 2) {
                allNews.add(newsContent);
              } else {
                break;
              }
            }
          }
          if (allNews.length == 2) {
            break;
          }
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
      child: HomeWidget(
        onTapped: widget._onTapped,
        allContent: allNews,
        allSuggestedGames: allSuggestedGames,
      ),
    );
  }
}
