import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/game_recent/recently_game_widget.dart';
import 'package:hynzo/widgets/common/view/game_view_widget.dart';

class AllGames extends StatefulWidget {
  final List<SuggestedPlayModel>? allSuggestedGames;

  const AllGames({
    Key? key,
    this.allSuggestedGames,
  }) : super(key: key);

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  List<AllGamesModel> allGames = [];
  List<RecentPlayed> allRecent = [];

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
    return SingleChildScrollView(
      child: Container(
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
            Container(
              width: mediaQuery.width,
              height: 140,
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
            Container(
              width: mediaQuery.width,
              height: 140,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.only(
                        right: 12.0,
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigation.pushNamed(context, Routes.webview,
                              {'link': widget.allSuggestedGames![index].redirectionUrl});
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
                                errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/no_image.png',fit: BoxFit.cover,),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.allSuggestedGames![index].gameName!,
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
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
            Container(
              width: mediaQuery.width,
              height: 450,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                  right: 15.0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
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
      ),
    );
  }
}
