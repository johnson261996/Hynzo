
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/edit_message_model.dart';
import 'package:hynzo/core/models/events_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/image/circle_image_widget.dart';
import 'package:hynzo/widgets/common/image/rectangle_image_view.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';
import 'package:hynzo/widgets/common/no_data/no_data_error.dart';
import 'package:hynzo/widgets/common/search_bar/search_bar.dart';
import 'package:hynzo/widgets/common/view/event_view_widget.dart';

class EditHomeWidget extends StatefulWidget {
  @override
  _EditHomeWidgetState createState() => _EditHomeWidgetState();
}

class _EditHomeWidgetState extends State<EditHomeWidget> {
  String search = '';
  List<EditMessageModel> allPeople = [];
  late final VoidCallback onClicked;
  List<EventsModel> allEvents = [];
  List<AllGamesModel> allGames = [];


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
    return SafeArea(
      child: Container(
          color: AppColors.white,
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigation.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0,left: 10.0,),
                      child: Image.asset(
                        'assets/images/top_back.png',
                        width: 15,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.02,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0,left: 10.0,),
                    child: Text(
                      Strings.Edit_HOME,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SearchBar(
                hintText: Strings.SEARCH_GAMES,
                onchangeFunc: (val) {
                  setState(() {
                    search = val;
                  });
                },
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,),
              ),
              const SizedBox(
                 height: 10,
              ),
             ListView(
               shrinkWrap: true,
               physics: ClampingScrollPhysics(),
               scrollDirection: Axis.vertical,
               padding: const EdgeInsets.all(8),
               children: [
                 Card(
                   semanticContainer: true,
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                   ),
                   elevation: 5,
                   margin: EdgeInsets.all(10),
                   child: Column(
                       children:[
                         Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 10.0,top:10.0),
                                 child: Text(
                                   Strings.NEW_MESSAGES,
                                   style:
                                   Theme.of(context).textTheme.headline6!.copyWith(
                                     color: AppColors.black,
                                     fontWeight: FontWeight.w600,
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 width: mediaQuery.width * 0.02,
                               ),
                               const Spacer(),
                               GestureDetector(
                                 /*    onTap: () {
                  widget.onTapped(2);
                  },*/
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
                                       SizedBox(
                                         width: mediaQuery.width * 0.005,
                                       ),
                                       Image.asset('assets/images/push_pin_off.png'),
                                     ],
                                   ),
                                 ),
                               )
                             ]
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Row(
                           children: [
                             Container(
                               width: mediaQuery.width*0.780,
                               child: Wrap(
                                   children: [
                                     Container(
                                       width: mediaQuery.width,
                                       height: 100,
                                       child: Padding(
                                         padding: EdgeInsets.all(10.0),
                                         child: ListView.builder(
                                           shrinkWrap: true,
                                           itemBuilder: (BuildContext context, int index) {
                                             final color = Theme.of(context).colorScheme.background;
                                             return Container(
                                                 padding: const EdgeInsets.only(
                                                   right: 15.0,
                                                 ),
                                                 child: GestureDetector(
                                                   onTap: (){
                                                     /*         check().then((internet) {
                                          if (internet != null && internet) {
                                            *//* Navigation.pushNamed(context, Routes.webview,
                                          {
                                          'link': widget
                                              .allSuggestedGames![index]
                                              .redirectionUrl
                                          });*//*
                                          } else {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NoDataError()));
                                          }
                                      });*/
                                                   },
                                                   child: Stack(children: [
                                                     CircleImageWidget(
                                                       imagePath: allPeople[index].imagePath!,
                                                     ),

                                                   ]
                                                   ),
                                                 ));
                                           },
                                           itemCount: allPeople.length,
                                           scrollDirection: Axis.horizontal,
                                         ),
                                       ),
                                     ),]
                               ),
                             ),
                             SizedBox(width: 10.0,),
                             IconButton(
                               icon: Image.asset('assets/images/more_dot.png'),
                               onPressed: () => {},
                             ),
                           ],
                         )

                       ]
                   ),
                 ),

                 const SizedBox(
                   height: 10,
                 ),
                 Card(
                     semanticContainer: true,
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                     elevation: 5,
                     margin: EdgeInsets.all(10),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                         Container(
                             width: mediaQuery.width,
                             height: 180,
                             child: Column(
                                 children:[
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 10.0),
                                           child: Text(
                                             Strings.SPECIAL_EVENTS,
                                             style:
                                             Theme.of(context).textTheme.headline6!.copyWith(
                                               color: AppColors.black,
                                               fontWeight: FontWeight.w600,
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: mediaQuery.width * 0.02,
                                         ),
                                         const Spacer(),
                                         GestureDetector(
                                           /*    onTap: () {
                                  widget.onTapped(2);
                                  },*/
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
                                                 SizedBox(
                                                   width: mediaQuery.width * 0.005,
                                                 ),
                                                 Image.asset('assets/images/push_pin_off.png'),
                                               ],
                                             ),
                                           ),
                                         )
                                       ]
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         width: mediaQuery.width*0.780,
                                         child: Wrap(
                                             children: [
                                               Container(
                                                 width: mediaQuery.width,
                                                 height: 130,
                                                 child: ListView.builder(
                                                   shrinkWrap: true,
                                                   itemBuilder: (BuildContext context, int index) {
                                                     final color = Theme.of(context).colorScheme.background;
                                                     return Container(
                                                         padding: const EdgeInsets.only(
                                                           right: 15.0,
                                                         ),
                                                         child: GestureDetector(
                                                           onTap: (){
                                                             /*         check().then((internet) {
                                        if (internet != null && internet) {
                                          *//* Navigation.pushNamed(context, Routes.webview,
                                        {
                                        'link': widget
                                            .allSuggestedGames![index]
                                            .redirectionUrl
                                        });*//*
                                        } else {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NoDataError()));
                                        }
                                      });*/
                                                           },
                                                           child: Stack(children: [
                                                             RectangleImageView(
                                                               imagePath: allEvents[index].imagePath!,
                                                             ),

                                                           ]
                                                           ),
                                                         ));
                                                   },
                                                   itemCount: allEvents.length,
                                                   scrollDirection: Axis.horizontal,
                                                 ),
                                               ),]
                                         ),
                                       ),
                                       SizedBox(width: 10.0,),
                                       IconButton(
                                         icon: Image.asset('assets/images/more_dot.png'),
                                         onPressed: () => {},
                                       ),
                                     ],
                                   )])
                         )],
                     )
                 ),
                 const SizedBox(
                   height: 10,
                 ),
                 Card(
                     semanticContainer: true,
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                     elevation: 5,
                     margin: EdgeInsets.all(10),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                         Container(
                             width: mediaQuery.width,
                             height: 180,
                             child: Column(
                                 children:[
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 10.0),
                                           child: Text(
                                             Strings.GAMES,
                                             style:
                                             Theme.of(context).textTheme.headline6!.copyWith(
                                               color: AppColors.black,
                                               fontWeight: FontWeight.w600,
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: mediaQuery.width * 0.02,
                                         ),
                                         const Spacer(),
                                         GestureDetector(
                                           /*    onTap: () {
                                  widget.onTapped(2);
                                  },*/
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
                                                 SizedBox(
                                                   width: mediaQuery.width * 0.005,
                                                 ),
                                                 Image.asset('assets/images/push_pin_off.png'),
                                               ],
                                             ),
                                           ),
                                         )
                                       ]
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         width: mediaQuery.width*0.780,
                                         child: Wrap(
                                             children: [
                                               Container(
                                                 width: mediaQuery.width,
                                                 height: 130,
                                                 child: ListView.builder(
                                                   shrinkWrap: true,
                                                   itemBuilder: (BuildContext context, int index) {
                                                     final color = Theme.of(context).colorScheme.background;
                                                     return Container(
                                                         padding: const EdgeInsets.only(
                                                           right: 15.0,
                                                         ),
                                                         child: GestureDetector(
                                                           onTap: (){
                                                             /*         check().then((internet) {
                                        if (internet != null && internet) {
                                          *//* Navigation.pushNamed(context, Routes.webview,
                                        {
                                        'link': widget
                                            .allSuggestedGames![index]
                                            .redirectionUrl
                                        });*//*
                                        } else {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NoDataError()));
                                        }
                                      });*/
                                                           },
                                                           child: Stack(children: [
                                                             SquareViewWidget(
                                                               imagePath: allGames[index].imagePath!,
                                                             ),

                                                           ]
                                                           ),
                                                         ));
                                                   },
                                                   itemCount: allGames.length,
                                                   scrollDirection: Axis.horizontal,
                                                 ),
                                               ),]
                                         ),
                                       ),
                                       SizedBox(width: 10.0,),
                                       IconButton(
                                         icon: Image.asset('assets/images/more_dot.png'),
                                         onPressed: () => {},
                                       ),
                                     ],
                                   )])
                         )],
                     )
                 )
               ],
             )
            ],
                  ),
          ), )
    );
  }


  @override
  void initState() {

    allGames.add(
      AllGamesModel(
        gameName: "Cricket",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Chess",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Archery",
        imagePath: "assets/images/suggested_three.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Poker",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Cricket",
        imagePath: "assets/images/suggested_one.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Chess",
        imagePath: "assets/images/suggested_two.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Archery",
        imagePath: "assets/images/suggested_three.png",
      ),
    );
    allGames.add(
      AllGamesModel(
        gameName: "Poker",
        imagePath: "assets/images/suggested_three.png",
      ),
    );

    allPeople.add(EditMessageModel(
     imagePath: 'assets/images/profile_pic1.png',
     personName: "Sunita", ));
    allPeople.add(EditMessageModel(
        imagePath: 'assets/images/profile_pic2.png',
        personName: 'Hildiberht'));
    allPeople.add(EditMessageModel(
        imagePath: 'assets/images/profile_pic3.png',
        personName: 'Clytia '));
    allPeople.add(EditMessageModel(
        imagePath: 'assets/images/profile_pic4.png',
            personName: 'Marinella '));
    //allPeople.add(EditMessageModel(imagePath: '',personName: ''));

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
        dateTime: 'Thu, 11 Nov'
        ,
      )
      ,
    );
  }


}
