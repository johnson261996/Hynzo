import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class NewsSwipeView extends StatefulWidget {
  const NewsSwipeView({Key? key}) : super(key: key);

  @override
  State<NewsSwipeView> createState() => _NewsSwipeViewState();
}

class _NewsSwipeViewState extends State<NewsSwipeView> {
  List<NewsModel> allNews = [];
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/news_big_image.png',
        newsTitle:
            'Samsung working on fast fix for sluggish refresh rate on Galaxy S21s running Android 12',
        newsContent:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\n \nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.',
        newsPublishedTime: '17 days ago',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/news_big_image.png',
        newsTitle:
            'Samsung working on fast fix for sluggish refresh rate on Galaxy S21s running Android 12',
        newsContent: '7 Skills of Highly Effective Programmers',
        newsPublishedTime: '3 days ago',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/news_big_image.png',
        newsTitle:
            'Samsung working on fast fix for sluggish refresh rate on Galaxy S21s running Android 12',
        newsContent: 'SMM starter pack, part 2: content promotion',
        newsPublishedTime: '17 days ago',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/news_big_image.png',
        newsTitle:
            'Samsung working on fast fix for sluggish refresh rate on Galaxy S21s running Android 12',
        newsContent: '7 Skills of Highly Effective Programmers',
        newsPublishedTime: '3 days ago',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/news_big_image.png',
        newsTitle:
            'Samsung working on fast fix for sluggish refresh rate on Galaxy S21s running Android 12',
        newsContent: 'SMM starter pack, part 2: content promotion',
        newsPublishedTime: '17 days ago',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/news_big_image.png',
        newsTitle:
            'Samsung working on fast fix for sluggish refresh rate on Galaxy S21s running Android 12',
        newsContent: '7 Skills of Highly Effective Programmers',
        newsPublishedTime: '3 days ago',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
        ),
        child: Dismissible(
          key: Key(selectedIndex.toString()),
          direction: selectedIndex > 0 ? DismissDirection.vertical : DismissDirection.up,
          onDismissed: (direction) {
            //print(direction == DismissDirection.up);
            if (direction == DismissDirection.down) {
              if (selectedIndex > 0) {
                setState(() {
                  selectedIndex--;
                });
              }
            } else {
              if (selectedIndex < allNews.length - 1) {
                setState(() {
                  selectedIndex++;
                });
              }
            }
            /*if (widget.data.articles.length - index < 15) {
              setState(() {
                page++;
              });
              widget.getNews(page++);
            }*/
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Image.asset(
                allNews[selectedIndex].newsImagePath!,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: mediaQuery.height * 0.03,
              ),
              Text(
                allNews[selectedIndex].newsTitle!,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                      color: AppColors.black,
                    ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    allNews[selectedIndex].newsContent!,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.offblack,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
