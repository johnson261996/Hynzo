import 'package:flutter/material.dart';
import 'package:hynzo/core/models/tab_header_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/news/month_news_widget.dart';
import 'package:hynzo/widgets/news/today_news_widget.dart';
import 'package:hynzo/widgets/news/tommorrow_news_widget.dart';
import 'package:hynzo/widgets/news/week_news_widget.dart';
import 'package:hynzo/widgets/news/year_news_widget.dart';

class NewsTabView extends StatefulWidget{
  @override
  State<NewsTabView> createState() => _NewsTabViewState();
}

class _NewsTabViewState extends State<NewsTabView> with TickerProviderStateMixin{

  List<TabHeaderModel> allTabHeader = [];
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
      _pageController=PageController();
      allTabHeader.add(
        TabHeaderModel(
          tabName: 'Today',
        ),
      );
      allTabHeader.add(
        TabHeaderModel(
          tabName: 'Tommorrow',
        ),
      );
      allTabHeader.add(
        TabHeaderModel(
          tabName: 'This Week',
        ),
      );
      allTabHeader.add(
        TabHeaderModel(
          tabName: 'This Month',
        ),
      );
      allTabHeader.add(
        TabHeaderModel(
          tabName: 'This Year',
        ),
      );
      tabController = TabController(
        initialIndex: selectedIndexValue,
        length: allTabHeader.length,
        vsync: this,
      );
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
              onTap: (index){
                setState(() {
                  selectedIndexValue = index;
                  _pageController.animateToPage(selectedIndexValue, duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                });
              },
              controller: tabController,
              indicatorColor: Colors.transparent,
              tabs:  List<Widget>.generate(allTabHeader.length, (int index){
                return Container(
                  padding: const EdgeInsets.only(left: 3.0,right: 3.0,),
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
              isScrollable:true,
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
                    tabController.animateTo(selectedIndexValue, duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                  });
                },
                children: const [
                  TodayNewsWidget(),
                  TommorrowNewsWidget(),
                  WeeekNewsWidget(),
                  MonthNewsWidget(),
                  YearNewsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}