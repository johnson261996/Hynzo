import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/models/tab_header_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/news/news_swipe_view.dart';
import 'package:hynzo/widgets/news/news_tab_view.dart';

class NewsWidget extends StatefulWidget {
  final List<NewsDataModel>? allNews;
  const NewsWidget({Key? key,this.allNews}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  bool showTabView = false;
  List<NewsContentDataModel> allContent =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allContent.clear();
    getNews();
  }
  void getNews() {
    for(int i =0; i<widget.allNews!.length;i++){
      for(int j =0 ; j< widget.allNews![i].newsDataContentList!.length;j++){
        allContent.add(widget.allNews![i].newsDataContentList![j]);
      }
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
                    !showTabView ? 'assets/images/flip.png' : 'assets/images/flip_view.png',
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
              allContent: allContent,
              allcategoryNews: widget.allNews,
            ),
          ] else ...[
            NewsSwipeView(
              allContent: allContent,
            ),
          ],
        ],
      ),
    );
  }
}
