import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/games_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/game_recent/recently_game_widget.dart';
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
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.height * 0.04,
          ),
          Text(
            Strings.RECENTLY_PLAYED,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.18,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                  ),
                  child: RecentGameWidget(
                    mediaQuery: mediaQuery,
                    imagePath: allRecent[index].imagePath!,
                    index: index,
                    name: allRecent[index].gameName!,
                  ),
                );
              },
              itemCount: allRecent.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.SUGGESTED_GAMES,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.18,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.only(
                      right: 12.0,
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
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.ALL_GAMES,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.55,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 15.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
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
