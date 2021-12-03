import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/models/tab_header_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/news/environment_news_widget.dart';
import 'package:hynzo/widgets/news/all_news_widget.dart';
import 'package:hynzo/widgets/news/business_news_widget.dart';
import 'package:hynzo/widgets/news/entartainment_news_widget.dart';
import 'package:hynzo/widgets/news/food_news_widget.dart';
import 'package:hynzo/widgets/news/health_news_widget.dart';
import 'package:hynzo/widgets/news/politics_news_widget.dart';
import 'package:hynzo/widgets/news/science_news_widget.dart';
import 'package:hynzo/widgets/news/sports_news_widget.dart';
import 'package:hynzo/widgets/news/technology_news_widget.dart';
import 'package:hynzo/widgets/news/top_news_widget.dart';
import 'package:hynzo/widgets/news/world_news_widget.dart';

class NewsTabView extends StatefulWidget {
  final List<NewsContentDataModel>? allContent;
  final List<NewsDataModel>? allcategoryNews;

  NewsTabView({
    Key? key,
    this.allContent,
    this.allcategoryNews,
  }) : super(key: key);

  @override
  State<NewsTabView> createState() => _NewsTabViewState();
}

class _NewsTabViewState extends State<NewsTabView>
    with TickerProviderStateMixin {
  List<TabHeaderModel> allTabHeader = [];
  List<NewsContentDataModel> allBusinessNews = [];
  List<NewsContentDataModel> allEntertainmentNews = [];
  List<NewsContentDataModel> allEnvNews = [];
  List<NewsContentDataModel> allFoodNews = [];
  List<NewsContentDataModel> allHealthNews = [];
  List<NewsContentDataModel> allPoliticsNews = [];
  List<NewsContentDataModel> allScienceNews = [];
  List<NewsContentDataModel> allSportsNews = [];
  List<NewsContentDataModel> allTechnologyNews = [];
  List<NewsContentDataModel> allTopNews = [];
  List<NewsContentDataModel> allWorldNews = [];
  int selectedIndexValue = 0;
  late TabController tabController;
  late PageController _pageController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'All',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Business',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Entertainment',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Environment',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Food',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Health',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Politics',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Science',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Sports',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Technology',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Top',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'World',
      ),
    );
    tabController = TabController(
      initialIndex: selectedIndexValue,
      length: allTabHeader.length,
      vsync: this,
    );
    getAllTabNews();
  }

  void getAllTabNews() {
    for( int i =0;i<widget.allcategoryNews!.length;i++){
      if(widget.allcategoryNews![i].category!.toLowerCase() == "business") {
        allBusinessNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "entertainment") {
        allEntertainmentNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "environment") {
        allEnvNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "food") {
        allFoodNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "health") {
        allHealthNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "science") {
        allScienceNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "politics") {
        allPoliticsNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "sports") {
        allSportsNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "technology") {
        allTechnologyNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "top") {
        allTopNews = widget.allcategoryNews![i].newsDataContentList!;
      }
      if(widget.allcategoryNews![i].category!.toLowerCase() == "world") {
        allWorldNews = widget.allcategoryNews![i].newsDataContentList!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 25.0,
            child: TabBar(
              padding: EdgeInsets.zero,
              onTap: (index) {
                setState(() {
                  selectedIndexValue = index;
                  _pageController.animateToPage(selectedIndexValue,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn);
                });
              },
              controller: tabController,
              indicatorColor: Colors.transparent,
              tabs: List<Widget>.generate(allTabHeader.length, (int index) {
                return Container(
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: index == selectedIndexValue
                        ? AppColors.blueDark
                        : AppColors.white,
                  ),
                  child: Center(
                    child: Text(
                      allTabHeader[index].tabName!,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
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
                    tabController.animateTo(selectedIndexValue,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  });
                },
                children: [
                  AllNewsWidget(
                    allContent: widget.allContent,
                  ),
                  BusinessNewsWidget(
                    allContent: allBusinessNews,
                  ),
                  EntertainmentNewsWidget(
                    allContent: allEntertainmentNews,
                  ),
                  EnvironmentNewsWidget(
                    allContent: allEnvNews,
                  ),
                  FoodNewsWidget(
                    allContent: allFoodNews,
                  ),
                  HealthNewsWidget(
                    allContent: allHealthNews,
                  ),
                  PoliticsNewsWidget(
                    allContent: allPoliticsNews,
                  ),
                  ScienceNewsWidget(
                    allContent: allScienceNews,
                  ),
                  SportsNewsWidget(
                    allContent: allSportsNews,
                  ),
                  TechnologyNewsWidget(
                    allContent: allTechnologyNews,
                  ),
                  TopNewsWidget(
                    allContent: allTopNews,
                  ),
                  WorldNewsWidget(
                    allContent: allWorldNews,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
