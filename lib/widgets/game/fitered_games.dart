
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/view/game_view_widget.dart';

class FilteredGamesWidget extends StatefulWidget{

  final String title ;
  final List<GamePlayModel>? filteredGames;

  const FilteredGamesWidget({
    Key? key,
    required this.title,
    this.filteredGames

  }) : super(key: key);
  @override
  State<FilteredGamesWidget> createState() => _FilteredGamesWidgetState();
}

class _FilteredGamesWidgetState extends State<FilteredGamesWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
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
                      onTap: (){
                        Navigation.pushNamed(context, Routes.webview,
                            {'link': widget.filteredGames![index].redirectionUrl});
                      },
                      child: GameContainerWidget(
                        imagePath: widget.filteredGames![index].image!,
                        name: widget.filteredGames![index].gameName!,
                      ),
                    );
                  },
                  itemCount: widget.filteredGames!.length,
                ),
              )
            ],
          ),
        )

    );
  }
}