import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/games_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';
import 'package:hynzo/widgets/common/view/game_view_widget.dart';
import 'package:hynzo/widgets/game/game.dart';

class AllGames extends StatefulWidget {
  const AllGames({Key? key}) : super(key: key);

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  List<AllGamesModel> allGames = [];
  List<RecentPlayed> allRecent = [];
  List<SuggestedPlayModel> allSuggested = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allRecent.add(
      RecentPlayed(
        gameName: "Cricket",
        imagePath: "assets/images/cricket.png",
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Chess",
        imagePath: "assets/images/chess.png",
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Archery",
        imagePath: "assets/images/archery.png",
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Poker",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allSuggested.add(
      SuggestedPlayModel(
        gameName: "Cricket",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allSuggested.add(
      SuggestedPlayModel(
        gameName: "Chess",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allSuggested.add(
      SuggestedPlayModel(
        gameName: "Archery",
        imagePath: "assets/images/suggested_three.png",
      ),
    );
    allSuggested.add(
      SuggestedPlayModel(
        gameName: "Poker",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Cricket",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Chess",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Archery",
        imagePath: "assets/images/suggested_three.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Poker",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Cricket",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Chess",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Archery",
        imagePath: "assets/images/suggested_three.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Poker",
        imagePath: "assets/images/suggested_three.png",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            Strings.RECENTLY_PLAYED,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SquareViewWidget(
                            imagePath: allRecent[index].imagePath!,
                          ),
                          if (index == 0) ...[
                            Positioned(
                              top: 15.0,
                              child: Container(
                                color: AppColors.yellow,
                                width: 35.0,
                                height: 13.0,
                                child: Center(
                                  child: Text(
                                    Strings.NEW,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        allRecent[index].gameName!,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                      )
                    ],
                  ),
                );
              },
              itemCount: allRecent.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            Strings.SUGGESTED_GAMES,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: GameContainerWidget(
                      imagePath: allSuggested[index].imagePath!,
                      name: allSuggested[index].gameName!,
                    ));
              },
              itemCount: allSuggested.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            Strings.ALL_GAMES,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 15.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GameContainerWidget(
                  imagePath: allGames[index].imagePath!,
                  name: allGames[index].gameName!,
                );
              },
              itemCount: allGames.length,
            ),
          )
        ],
      ),
    );
  }
}
