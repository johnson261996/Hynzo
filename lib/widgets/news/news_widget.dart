import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/news/news_swipe_view.dart';
import 'package:hynzo/widgets/news/news_tab_view.dart';

class NewsWidget extends StatefulWidget {
  final bool isBackEnable;
  final List<Article>? allNews;

  const NewsWidget({
    Key? key,
    this.allNews,
    this.isBackEnable = true,
  }) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  bool showTabView = false;

  // List<Article> allContent = [];

  @override
  void initState() {
    super.initState();
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
            height: mediaQuery.height * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isBackEnable)
                  InkWell(
                    onTap: () {
                      Navigation.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/top_back.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                SizedBox(
                  width: mediaQuery.width * 0.02,
                ),
                Text(
                  Strings.NEWS,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showTabView = !showTabView;
                    });
                  },
                  child: Image.asset(
                    !showTabView
                        ? 'assets/images/flip.png'
                        : 'assets/images/flip_view.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.02,
          ),
          if (showTabView) ...[
            NewsTabView(
              allContent: widget.allNews,
            ),
          ] else ...[
            NewsSwipeView(
              allContent: widget.allNews,
            ),
          ],
        ],
      ),
    );
  }
}
