///Widget created for home screen.
import 'dart:convert';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/covid_model.dart';
import 'package:hynzo/core/models/events_model.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/analytics_events.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/carouselSlider/carousel_slider.dart';
import 'package:hynzo/widgets/common/no_data/no_data_error.dart';
import 'package:hynzo/widgets/common/profile_image/profile_image.dart';
import 'package:hynzo/widgets/covid/covid_top_widget.dart';
import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';


class HomeWidget extends StatefulWidget {
  final Function onTapped;
  final List<Article>? allContent;
  final CovidData? covidData;
  final UserProfileModel userDetails;
  final List<GamePlayModel>? allSuggestedGames;
  final Function(String)? setFcmToken;


  const HomeWidget(
      {required this.onTapped,
      this.allContent,
      this.covidData,
      this.allSuggestedGames,
        required this.userDetails,
        this.setFcmToken,
      Key? key})
      : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String name = '';
  String today_news = "Today's News";
  int coin = 0;
  String url = "";
  String search = '';
  List<EventsModel> allEvents = [];
  String pinned_items='';
  Map<String,dynamic> PinnedMapItems ={};

  @override
  void initState() {
    setFcmToken();
    _getListData();
    super.initState();

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

  _getListData() async{
    await LocalStorage.getPinnedStatus().then((value) =>  pinned_items=value! );
    if(pinned_items!='') {
      PinnedMapItems = json.decode(pinned_items);
    }
    log("Home map" + PinnedMapItems.toString(),);
    for (var key in PinnedMapItems.keys) log(key);
  }

  getName() async {
    name = (await LocalStorage.getUserFullName())!;
  }

  getProfilePic() async {
    url = (await LocalStorage.getProfilePic())!;
  }

  setFcmToken() async {
    String? token = await LocalStorage.getFcmToken();
    widget.setFcmToken!(token!);
  }

  String getDate(String time) {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy');
    String currentDate = formatter.format(now);
    var newsdate = DateTime.parse(time);
    String newsDate = formatter.format(newsdate);
    if (currentDate.split("/")[0] == newsDate.split("/")[0]) {
      return DateFormat.jm().format(DateTime.parse(time));
    } else {
      var diff = now.difference(newsdate).inDays;
      if (diff > 1) {
        return newsDate;
      } else {
        return 'Yesterday';
      }
    }
  }

  //check the internet connection
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    name = widget.userDetails.full_name ?? '';
    url = widget.userDetails.avatar ?? '';
    return SafeArea(
      child: Container(
        width: mediaQuery.width,
        color: AppColors.white,
        height: mediaQuery.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileImageWidget(
                    backgroundcolor: AppColors.offyellow,
                    valueColor: AppColors.darkyellow,
                    imageUrl: url,
                    level: 1,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome $name',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                            fontSize: 20,
                            color: AppColors.gray,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          Strings.HOME_PROFILE_SUBTITLE,
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                            fontSize: 12,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // SearchBar(
            //   hintText: Strings.SEARCH_GAMES,
            //   onchangeFunc: (val) {
            //     setState(() {
            //       search = val;
            //     });
            //   },
            //   padding: const EdgeInsets.only(
            //     left: 20.0,
            //     right: 20.0,
            //   ),
            // ),
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
                      // const SizedBox(
                      //   height: 10,
                      // ),

                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          height: 130.0,
                          child: const CarouselSliderWidget()),
                      const SizedBox(
                        height: 10,
                      ),

                     if(PinnedMapItems['Covid 19']??true) Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.COVID,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.02,
                          ),
                          if (widget.covidData != null)
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 15, bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigation.pushNamed(context, Routes.covid);
                                },
                                child:
                                CovidHeading(covidData: widget.covidData!),
                              ),
                            )
                        ],
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       Strings.SPECIAL_EVENTS,
                      //       style:
                      //           Theme.of(context).textTheme.headline6!.copyWith(
                      //                 color: AppColors.black,
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //     ),
                      //     SizedBox(
                      //       width: mediaQuery.width * 0.02,
                      //     ),
                      //     Container(
                      //       height: 25.0,
                      //       width: 35.0,
                      //       color: AppColors.red,
                      //       child: Center(
                      //         child: Text(
                      //           Strings.NEW,
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .subtitle2!
                      //               .copyWith(
                      //                   color: AppColors.white,
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w400),
                      //         ),
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     GestureDetector(
                      //       onTap: () {
                      //         widget.onTapped(2);
                      //       },
                      //       child: Container(
                      //         padding: const EdgeInsets.only(
                      //           right: 20.0,
                      //           top: 5.0,
                      //           bottom: 5.0,
                      //           left: 10.0,
                      //         ),
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               Strings.VIEW_ALL,
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .subtitle2!
                      //                   .copyWith(
                      //                     color: AppColors.whitegrey,
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.w400,
                      //                   ),
                      //             ),
                      //             SizedBox(
                      //               width: mediaQuery.width * 0.005,
                      //             ),
                      //             Image.asset('assets/images/right_arrow.png'),
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   width: mediaQuery.width,
                      //   height: 230,
                      //   child: ListView.builder(
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Container(
                      //           padding: const EdgeInsets.only(
                      //             right: 15.0,
                      //           ),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               check().then((internet) {
                      //                 if (internet != null && internet) {
                      //                   /* Navigation.pushNamed(context, Routes.webview,
                      //             {
                      //             'link': widget
                      //                 .allSuggestedGames![index]
                      //                 .redirectionUrl
                      //             });*/
                      //                 } else {
                      //                   Navigator.of(context).push(
                      //                       MaterialPageRoute(
                      //                           builder: (context) =>
                      //                               const NoDataError()));
                      //                 }
                      //               });
                      //             },
                      //             child: EventContainerWidget(
                      //               imagePath: allEvents[index].imagePath!,
                      //               title: allEvents[index].title!,
                      //               subTitle: allEvents[index].subTitle!,
                      //               dateTime: allEvents[index].dateTime!,
                      //               showDate: true,
                      //               showSubTitle: true,
                      //             ),
                      //           ));
                      //     },
                      //     itemCount: allEvents.length,
                      //     scrollDirection: Axis.horizontal,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      if(PinnedMapItems['Games']??true)Column(
                        children: [
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
                                onTap: () {
                                  widget.onTapped(3);
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                    left: 10.0,
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
                                          fontSize: 12,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: mediaQuery.width,
                            height: 140,
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    padding: const EdgeInsets.only(
                                      right: 12.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        check().then((internet) {
                                          if (internet) {
                                            FireAnalytics().log(
                                                'game',
                                                widget.allSuggestedGames![index]
                                                    .gameName!);
                                            Navigation.pushNamed(
                                                context, Routes.webview, {
                                              'link': widget
                                                  .allSuggestedGames![index]
                                                  .redirectionUrl
                                            });
                                          } else {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NoDataError()));
                                          }
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                            child: Image.network(
                                              widget
                                                  .allSuggestedGames![index].image!,
                                              fit: BoxFit.cover,
                                              width: 110.0,
                                              height: 110.0,
                                              errorBuilder:
                                                  (context, error, stackTrace) =>
                                                  Image.asset(
                                                    'assets/images/no_image.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            widget.allSuggestedGames![index]
                                                .gameName!,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              },
                              itemCount: widget.allSuggestedGames!.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                      if (widget.allContent!.isNotEmpty && ( PinnedMapItems['Todays News']??true)) ...[
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Strings.TODAY_NEWS,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: mediaQuery.width * 0.02,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(Routes.news);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                  top: 5.0,
                                  bottom: 5.0,
                                  left: 10.0,
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaQuery.width * 0.005,
                                    ),
                                    Image.asset(
                                        'assets/images/right_arrow.png'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: mediaQuery.width,
                          height: 380,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigation.pushNamed(context, Routes.webview,
                                      {'link': widget.allContent![index].url});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 15.0,
                                    top: 5.0,
                                  ),
                                  height: 90.0,
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 80.0,
                                          height: 90.0,
                                          child: ClipRRect(
                                            borderRadius:
                                            const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                            ),
                                            child: Image.network(
                                              widget.allContent![index]
                                                  .urlToImage!,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                  stackTrace) =>
                                                  ClipRRect(
                                                    borderRadius: const BorderRadius
                                                        .only(
                                                        topLeft:
                                                        Radius.circular(10.0),
                                                        bottomLeft:
                                                        Radius.circular(10.0)),
                                                    child: Image.asset(
                                                      'assets/images/no_image.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: mediaQuery.width * 0.03,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: mediaQuery.width * 0.65,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        widget.allContent![index]
                                                            .title!
                                                            .replaceAll(
                                                            RegExp(
                                                                r'[^A-Za-z0-9().,;?]'),
                                                            ' '),
                                                        maxLines: 4,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6!
                                                            .copyWith(
                                                          color: AppColors
                                                              .greyBlue,
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    // Text(
                                                    //   getDate(widget
                                                    //       .allContent![index]
                                                    //       .publishedAt
                                                    //       .toString()),
                                                    //   style: Theme.of(context)
                                                    //       .textTheme
                                                    //       .subtitle1!
                                                    //       .copyWith(
                                                    //         fontSize: 10.33,
                                                    //         fontWeight:
                                                    //             FontWeight.w400,
                                                    //         fontFamily:
                                                    //             'open_sans',
                                                    //         color: AppColors
                                                    //             .greyBlue,
                                                    //       ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: mediaQuery.height * 0.01,
                                              // ),
                                              // SizedBox(
                                              //   width: 150.0,
                                              //   child: Text(
                                              //     widget.allContent![index]
                                              //         .description!
                                              //         .replaceAll(
                                              //             RegExp(
                                              //                 r'[^A-Za-z0-9().,;?]'),
                                              //             ' '),
                                              //     overflow: TextOverflow.ellipsis,
                                              //     style: Theme.of(context)
                                              //         .textTheme
                                              //         .subtitle1!
                                              //         .copyWith(
                                              //           fontWeight:
                                              //               FontWeight.w400,
                                              //           fontSize: 16,
                                              //           color:
                                              //               AppColors.blackBlue,
                                              //         ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: widget.allContent!.length,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                      const SizedBox(
                        height: 30,
                      ),
                      if(PinnedMapItems['Games by Categories']??true)Column(
                        children: [
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
                                onTap: () {
                                  widget.onTapped(3);
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                    left: 10.0,
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
                                          fontSize: 12,
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
                          const SizedBox(
                            height: 10,
                          ),

                          Container(
                            margin: const EdgeInsets.only(
                              right: 20.0,
                            ),
                            width: mediaQuery.width,
                            //height: 200,
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 3.1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    final get = GetStorage();
                                    get.writeInMemory('game', index);
                                    widget.onTapped(3);
                                  },
                                  child: Image.asset(Images.GAME_CATEGORIES[index]),
                                );
                              },
                              itemCount: Images.GAME_CATEGORIES.length,
                            ),
                          ),
                        ],

                      ),


                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
