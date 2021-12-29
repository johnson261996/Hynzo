import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/view/game_view_widget.dart';

class TopChartsWidget extends StatefulWidget {
  final List<GamePlayModel>? popularGames;

  const TopChartsWidget({Key? key, this.popularGames}) : super(key: key);

  @override
  State<TopChartsWidget> createState() => _TopChartsWidgetState();
}

class _TopChartsWidgetState extends State<TopChartsWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery
        .of(context)
        .size;
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  Strings.POPULAR_GAMES,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6!
                      .copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
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
                    right: 10.0,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigation.pushNamed(context, Routes.webview,
                            {
                              'link': widget.popularGames![index].redirectionUrl
                            });
                      },
                      child: GameContainerWidget(
                        imagePath: widget.popularGames![index].image!,
                        name: widget.popularGames![index].gameName!,
                      ),
                    );
                  },
                  itemCount: widget.popularGames!.length,
                ),
              )
            ],
          ),
        )

    );
  }
}