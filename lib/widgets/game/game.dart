import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/tab_header_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/search_bar/search_bar.dart';
import 'package:hynzo/widgets/game/all_games.dart';
import 'package:hynzo/widgets/game/fitered_games.dart';

class GameWidget extends StatefulWidget {
  final List<GamePlayModel>? allSuggestedGames;
  final List<GamePlayModel>? recentlyPlayedGames;
  final List<GamePlayModel>? allGames;
  final List<GamePlayModel>? popularGames;
  final Function(String)? filteredGames;

  const GameWidget(
      {Key? key,
      this.allSuggestedGames,
      this.recentlyPlayedGames,
      this.allGames,
      this.popularGames,
      this.filteredGames})
      : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> with TickerProviderStateMixin {
  List<TabHeaderModel> allTabHeader = [];
  late String text = '';
  int selectedIndexValue = 0;
  late TabController tabController;
  late PageController _pageController;
  String search = '';
  bool showSearchBar = false;
  String category = '';
  String selectedItemName = '';
  List<GamePlayModel> filteredLIst = [];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    tabController.dispose();
  }

  getFilteredGames(String tag) async {
    FilteredGamesResponseModel response = await widget.filteredGames!(tag);
    setState(() {
      filteredLIst = response.filteredGames!;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'All games',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Action',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Arcade',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Casual',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Sports',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'All',
      ),
    );
    tabController = TabController(
      initialIndex: selectedIndexValue,
      length: allTabHeader.length,
      vsync: this,
    );
    final get = GetStorage();
    if (get.hasData('game')) {
      int i = get.read('game');
      i++;
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        setState(() {
          selectedIndexValue = i;
          selectedItemName = allTabHeader[i].tabName!;
          getFilteredGames(selectedItemName);
          tabController.animateTo(selectedIndexValue,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastLinearToSlowEaseIn);
          _pageController.animateToPage(selectedIndexValue,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.height * 0.06,
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
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                // const Spacer(),
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       showSearchBar = !showSearchBar;
                //     });
                //   },
                //   icon: Icon(
                //     Icons.search,
                //     size: 20,
                //     color: AppColors.offBlack,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.005,
          ),
          if (showSearchBar) ...[
            SearchBar(
              hintText: Strings.SEARCH_GAMES,
              onchangeFunc: (val) {
                setState(() {
                  search = val;
                });
              },
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
          ],
          const SizedBox(
            height: 10,
          ),
          TabBar(
            padding: EdgeInsets.zero,
            onTap: (index) {
              setState(() {
                selectedItemName = allTabHeader[index].tabName!;
                selectedIndexValue = index;
                getFilteredGames(selectedItemName);
                _pageController.animateToPage(selectedIndexValue,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn);
              });
            },
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: List<Widget>.generate(allTabHeader.length, (int index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: index == selectedIndexValue
                      ? AppColors.blueDark
                      : AppColors.white,
                ),
                child: Center(
                  child: Text(
                    allTabHeader[index].tabName!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(
                      fontSize: 12,
                      color: index == selectedIndexValue
                          ? AppColors.white
                          : AppColors.greyBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
            isScrollable: true,
          ),
          SizedBox(
            height: mediaQuery.height * 0.015,
          ),
          Divider(
            color: AppColors.offgrey,
            height: 1.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 15.0,
              ),
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    selectedIndexValue = page;
                    selectedItemName = allTabHeader[page].tabName!;
                    getFilteredGames(selectedItemName);
                    tabController.animateTo(selectedIndexValue,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn);
                  });
                },
                children: [
                  AllGames(
                    allSuggestedGames: widget.allSuggestedGames,
                    recentGames: widget.recentlyPlayedGames,
                    allGames: widget.allGames,
                  ),
                  FilteredGamesWidget(
                      title: 'Action Games', filteredGames: filteredLIst),
                  FilteredGamesWidget(
                      title: 'Arcade Games', filteredGames: filteredLIst),
                  FilteredGamesWidget(
                      title: 'Casual Games', filteredGames: filteredLIst),
                  FilteredGamesWidget(
                      title: 'Sports Games', filteredGames: filteredLIst),
                  FilteredGamesWidget(
                      title: 'All', filteredGames: filteredLIst),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
