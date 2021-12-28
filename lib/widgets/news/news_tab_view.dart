import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/news/all_news_widget.dart';

class NewsTabView extends StatefulWidget {
  final List<Article>? allContent;

  const NewsTabView({
    Key? key,
    this.allContent,
  }) : super(key: key);

  @override
  State<NewsTabView> createState() => _NewsTabViewState();
}

class _NewsTabViewState extends State<NewsTabView>
    with TickerProviderStateMixin {
  int selectedIndexValue = 0;
  late TabController tabController;
  late PageController _pageController;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
