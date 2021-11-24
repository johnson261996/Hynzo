import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/game_tab_header_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/game/action.dart';
import 'package:hynzo/widgets/game/adventure.dart';
import 'package:hynzo/widgets/game/all_games.dart';
import 'package:hynzo/widgets/game/board.dart';
import 'package:hynzo/widgets/game/card.dart';
import 'package:hynzo/widgets/game/top_charts.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  List<GameTabHeaderModel> allGameHeader = [];
  int selectedIndexValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allGameHeader.add(
      GameTabHeaderModel(tabName: 'All games', isSelected: true),
    );
    allGameHeader.add(
      GameTabHeaderModel(tabName: 'Top charts', isSelected: false),
    );
    allGameHeader.add(
      GameTabHeaderModel(tabName: 'Actions', isSelected: false),
    );
    allGameHeader.add(
      GameTabHeaderModel(tabName: 'Cards', isSelected: false),
    );
    allGameHeader.add(
      GameTabHeaderModel(tabName: 'Adventure', isSelected: false),
    );
    allGameHeader.add(
      GameTabHeaderModel(tabName: 'Board', isSelected: false),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return AllGames();
      case 1:
        return TopCharts();
      case 2:
        return ActionGames();
      case 3:
        return CardGames();
      case 4:
        return AdventureGames();
      case 5:
        return BoardGames();
      default:
        return AllGames();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  Strings.GAMES,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: AppColors.greyBlack),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.greyBlackTypeTwo,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            width: MediaQuery.of(context).size.width,
            height: 25.0,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < allGameHeader.length; i++) {
                      if (i == index) {
                        allGameHeader[i].isSelected = true;
                      } else {
                        allGameHeader[i].isSelected = false;
                      }
                    }
                    setState(() {
                      selectedIndexValue = index;
                    });
                  },
                  child: Container(
                    width: 70.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: allGameHeader[index].isSelected
                          ? AppColors.blueDark
                          : AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        allGameHeader[index].tabName!,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 12,
                              color: allGameHeader[index].isSelected
                                  ? AppColors.white
                                  : AppColors.greyBlack,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: allGameHeader.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Divider(
            color: AppColors.lightergray,
            height: 2.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: _getSelectedWidget(selectedIndexValue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
