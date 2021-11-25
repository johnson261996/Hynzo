///Widget created for home screen.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/events_model.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'common/game_recent/recently_game_widget.dart';
import 'common/profile_image/profile_image.dart';
import 'common/view/event_view_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late String search = '';
  List<RecentPlayed> allRecent = [];
  List<GamesCategoryModel> allGamesCategory = [];
  List<EventsModel> allEvents = [];
  List<NewsModel> allNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allGamesCategory.add(
      GamesCategoryModel(
        imagePath: 'assets/images/category_rectangle_one.png',
      ),
    );
    allGamesCategory.add(
      GamesCategoryModel(
        imagePath: 'assets/images/category_rectangle_two.png',
      ),
    );
    allGamesCategory.add(
      GamesCategoryModel(
        imagePath: 'assets/images/category_rectangle_three.png',
      ),
    );
    allGamesCategory.add(
      GamesCategoryModel(
        imagePath: 'assets/images/category_rectangle_four.png',
      ),
    );
    allGamesCategory.add(
      GamesCategoryModel(
        imagePath: 'assets/images/category_rectangle_five.png',
      ),
    );
    allGamesCategory.add(
      GamesCategoryModel(
        imagePath: 'assets/images/category_rectangle_six.png',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/social_media.png',
        newsImageBackground: 'assets/images/news_one.png',
        newsTitle: 'MEDIA',
        newsContent: 'SMM starter pack, part 2: content promotion',
        newsPublishedTime: '17 days ago',
      ),
    );
    allNews.add(
      NewsModel(
        newsImagePath: 'assets/images/computer.png',
        newsImageBackground: 'assets/images/news_two.png',
        newsTitle: 'PRODUCTIVITY',
        newsContent: '7 Skills of Highly Effective Programmers',
        newsPublishedTime: '3 days ago',
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Cricket",
        imagePath: "assets/images/cricket.png",
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Chess",
        imagePath: "assets/images/chess.png",
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Archery",
        imagePath: "assets/images/archery.png",
      ),
    );
    allRecent.add(
      RecentPlayed(
        gameName: "Poker",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allEvents.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_one.png',
        title: 'Sunday Night Party',
        subTitle: 'Badmash Louunge: Koramongala',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allEvents.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_two.png',
        title: 'Sunday Night Party',
        subTitle: 'Badmash Louunge: Koramongala',
        dateTime: 'Fri, 12 Nov',
      ),
    );
    allEvents.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_one.png',
        title: 'Sunday Night Party',
        subTitle: 'Badmash Louunge: Koramongala',
        dateTime: 'Thu, 11 Nov',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: mediaQuery.width,
        color: AppColors.white,
        height: mediaQuery.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaQuery.height * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ProfileImageWidget(),
                  SizedBox(
                    width: mediaQuery.width * 0.03,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.HOME_PROFILE_NAME,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 20,
                              color: AppColors.gray,
                            ),
                      ),
                      SizedBox(
                        width: mediaQuery.height * 0.02,
                      ),
                      Text(
                        Strings.HOME_PROFILE_SUBTITLE,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 15,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 75.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: AppColors.blueDark,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: AppColors.yellowLight,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/coin.png',
                              width: 15.0,
                              height: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.02,
                        ),
                        Text(
                          Strings.AMOUNT,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: AppColors.white,
                                  ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                alignment: Alignment.center,
                height: 45.0,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText2,
                  textInputAction: TextInputAction.done,
                  onChanged: (val) {
                    setState(() {
                      search = val;
                    });
                  },
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {},
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Image.asset('assets/images/search.png'),
                    border: InputBorder.none,
                    hintText: Strings.SEARCH_GAMES,
                    hintStyle: Theme.of(context).textTheme.bodyText2!.apply(
                          color: AppColors.lightgray,
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mediaQuery.height * 0.015,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(
                            right: 20.0,
                          ),
                          height: 130.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/images/home_rectangle.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.SPECIAL_EVENTS,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.02,
                          ),
                          Container(
                            height: 15.0,
                            width: 35.0,
                            color: AppColors.red,
                            child: Center(
                              child: Text(
                                Strings.NEW,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: AppColors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.VIEW_ALL,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: AppColors.whitegrey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.005,
                                  ),
                                  Image.asset('assets/images/right_arrow.png'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.width,
                        height: mediaQuery.height * 0.27,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.only(
                                right: 15.0,
                              ),
                              child: EventContainerWidget(
                                imagePath: allEvents[index].imagePath!,
                                title: allEvents[index].title!,
                                subTitle: allEvents[index].subTitle!,
                                dateTime: allEvents[index].dateTime!,
                                showDate: true,
                                showSubTitle: true,
                              ),
                            );
                          },
                          itemCount: allEvents.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.MUST_TRY_GAMES,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.02,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.VIEW_ALL,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: AppColors.whitegrey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.005,
                                  ),
                                  Image.asset('assets/images/right_arrow.png'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.width,
                        height: mediaQuery.height * 0.18,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.only(
                                right: 12.0,
                              ),
                              child: RecentGameWidget(
                                mediaQuery: mediaQuery,
                                imagePath: allRecent[index].imagePath!,
                                index: index,
                                name: allRecent[index].gameName!,
                              ),
                            );
                          },
                          itemCount: allRecent.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.TODAY_NEWS,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.02,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.MORE_NEWS,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: AppColors.whitegrey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.005,
                                  ),
                                  Image.asset('assets/images/right_arrow.png'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        width: mediaQuery.width,
                        height: mediaQuery.height * 0.31,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: mediaQuery.height * 0.15,
                              margin: const EdgeInsets.only(
                                right: 20.0,
                                bottom: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: mediaQuery.height * 0.15,
                                      child: Stack(
                                        children: [
                                          Image.asset(allNews[index]
                                              .newsImageBackground!),
                                          Positioned.fill(
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    allNews[index]
                                                        .newsImagePath!,
                                                    width: 45.0,
                                                    height: 45.0,
                                                  ))),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaQuery.width * 0.05,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          allNews[index].newsTitle!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                color: AppColors.greyBlue,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'open_sans',
                                              ),
                                        ),
                                        SizedBox(
                                          height: mediaQuery.height * 0.01,
                                        ),
                                        Container(
                                          width: 150.0,
                                          child: Text(
                                            allNews[index].newsContent!,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackBlue,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        right: 15.0,
                                        top: 32.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          allNews[index].newsPublishedTime!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                fontSize: 10.33,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'open_sans',
                                                color: AppColors.greyBlue,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: allNews.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.GAMES_BY_CATEGORIES,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.02,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.ALL_GAMES_HOME,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: AppColors.whitegrey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.005,
                                  ),
                                  Image.asset('assets/images/right_arrow.png'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20.0,),
                        width: mediaQuery.width,
                        height: mediaQuery.height * 0.26,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 3.1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                              return Image.asset(allGamesCategory[index].imagePath!);
                          },
                          itemCount: allGamesCategory.length,
                        ),

                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
