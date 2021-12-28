import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/services/game/game_service.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/view/game_view_widget.dart';

class AllGames extends StatefulWidget {
  final List<GamePlayModel>? allSuggestedGames;
  final List<GamePlayModel>? recentGames;
  final List<GamePlayModel>? allGames;

  const AllGames(
      {Key? key, this.allSuggestedGames, this.recentGames, this.allGames})
      : super(key: key);

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          Text(
            Strings.RECENTLY_PLAYED,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: mediaQuery.width,
            height: 140,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.only(
                      right: 12.0,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        int? uid = await LocalStorage.getUserID();
                        GameService()
                            .getLeaderboard(widget.recentGames![index].id!);
                        Navigation.pushNamed(context, Routes.webview, {
                          'link': widget.recentGames![index].redirectionUrl! +
                              '&userid=$uid'
                        });
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              widget.recentGames![index].image!,
                              fit: BoxFit.cover,
                              width: 110.0,
                              height: 110.0,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/no_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.recentGames![index].gameName!,
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                          )
                        ],
                      ),
                    ));
              },
              itemCount: widget.recentGames!.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            Strings.SUGGESTED_GAMES,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: mediaQuery.width,
            height: 140,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.only(
                      right: 12.0,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        int? uid = await LocalStorage.getUserID();
                        GameService().getLeaderboard(
                            widget.allSuggestedGames![index].id!);
                        Navigation.pushNamed(context, Routes.webview, {
                          'link':
                              widget.allSuggestedGames![index].redirectionUrl! +
                                  '&userid=$uid'
                        });
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              widget.allSuggestedGames![index].image!,
                              fit: BoxFit.cover,
                              width: 110.0,
                              height: 110.0,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/no_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.allSuggestedGames![index].gameName!,
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                          )
                        ],
                      ),
                    ));
              },
              itemCount: widget.allSuggestedGames!.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            Strings.ALL_GAMES,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: mediaQuery.width,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10,
                bottom: 100,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    int? uid = await LocalStorage.getUserID();
                    GameService().getLeaderboard(widget.allGames![index].id!);
                    Navigation.pushNamed(context, Routes.webview, {
                      'link': widget.allGames![index].redirectionUrl! +
                          '&userid=$uid'
                    });
                  },
                  child: GameContainerWidget(
                    imagePath: widget.allGames![index].image!,
                    name: widget.allGames![index].gameName!,
                  ),
                );
              },
              itemCount: widget.allGames!.length,
            ),
          )
        ],
      ),
    );
  }
}
