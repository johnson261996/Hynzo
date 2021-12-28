/// Contains service and logic related of home screen.
///
///
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/game_suggestion.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/models/suggestion_model.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/providers/game_provider.dart';
import 'package:hynzo/providers/home_provider.dart';
import 'package:hynzo/providers/news_provider.dart';
import 'package:hynzo/providers/user_profile_provider.dart';
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
  static UserProfileProvider? _userProvider;
  List<Article> allNews = [];
  List<GameSuggestion> allSuggestedGames = [];
  UserProfileModel userDatas = UserProfileModel();
  bool _isLoading = false;
  late HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _newsProvider = Provider.of<NewsProvider>(context, listen: false);
    _gamesProvider = Provider.of<GamesProvider>(context, listen: false);
    _userProvider = Provider.of<UserProfileProvider>(context, listen: false);
    allNews.clear();
    getSuggestionGames();
    getAllNews();
    getUserData();
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
      GameSuggestionModel suggestedGamesResponseModel =
          await _gamesProvider!.getSuggestedGames();
      if (suggestedGamesResponseModel.statusCode == 200) {
        setState(() {
          allSuggestedGames = suggestedGamesResponseModel.results;
        });
      } else {
        ToastUtil().showToast("Something went wrong.3");
      }
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
        for (var element in newsResponseModel.results) {
          if (element.news.articles.isNotEmpty) {
            setState(() {
              allNews = element.news.articles;
            });
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

  Future<void> getUserData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      UserProfileModel userProfileModel = await _userProvider!.getUser();
      if (userProfileModel.statusCode == 200) {
        setState(() {
          userDatas = userProfileModel;
        });
      } else {
        ToastUtil().showToast("Something went wrong.3");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<Map<String, dynamic>> setFcmToken(String token) async {
    final Map<String, dynamic> response =
        await _homeProvider.setFcmToken(token);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProfileProvider>(context, listen: false);
    _homeProvider = Provider.of<HomeProvider>(context);
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: HomeWidget(
        onTapped: widget._onTapped,
        allContent: allNews,
        allSuggestedGames: allSuggestedGames,
        userDetails: _userProvider!.userProfileModel,
        setFcmToken: setFcmToken,
      ),
    );
  }
}
