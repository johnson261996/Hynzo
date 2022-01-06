import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/leaderboard_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardWidget extends StatefulWidget {
  @override
  _LeaderboardWidgetState createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  int coin = 0;
  bool _isLoading = true;
  List<LeaderboardModel> _items = [];

  @override
  void initState() {
    _getLeaderboardData();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      extendBody: true,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(
                width:mediaQuery.width,
              child: Stack(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: mediaQuery.height * 0.5,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/images/chess_home.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: new Container(
                      decoration:
                          new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Image.asset(
                            'assets/images/coin.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                        Text(
                          "$coin",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: AppColors.blue,
                              ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: mediaQuery.width * 0.2,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Chess",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.breeSerif().copyWith(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: AppColors.blueDark,
                          blurRadius: 5,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: mediaQuery.width * 0.355,
                  right: mediaQuery.width * 0.335,
                  left: mediaQuery.width * 0.335,
                  bottom: mediaQuery.width * 0.355,
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          color: Colors.white,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: const SquareViewWidget(
                        imagePath:
                        'assets/images/chess.png',
                      )),
                ),

                Positioned(
                  bottom: mediaQuery.width * 0.10,
                  left: mediaQuery.width * 0.25,
                  right: mediaQuery.width * 0.25,
                  child: Image.asset(
                    'assets/images/Play_Button.png',
                  ),
                ),
              ]),
            ),
              Expanded(
                child: Container(
                 child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 10,bottom: 10),
                     child: Text(
                       'Leaderboard',
                       style: TextStyle(color: Colors.blue, fontSize: 25.0),
                     ),
                   ),
                    Expanded(
                      child: ListView.builder(
                         shrinkWrap: true,
                         physics: const ClampingScrollPhysics(),
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         itemCount: _items.length,
                         itemBuilder: (context, index) {
                           return Card(
                             margin: const EdgeInsets.only(bottom: 10),
                             color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,

                             child: Container(
                               padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(_items[index].no,
                                       style: TextStyle(fontSize: 16.0, color: Colors.white)),
                                   const SizedBox(
                                     width: 10,
                                   ),
                                   CircleAvatar(
                                     radius: 30.0,
                                     backgroundImage:
                                     ExactAssetImage(_items[index].img),
                                     backgroundColor: Colors.transparent,
                                   ),
                                   const SizedBox(
                                       width:10),
                                   Text(_items[index].title,
                                       style: TextStyle(fontSize: 16.0, color: Colors.white)),
                                   const SizedBox(
                                       width: 20),
                                   Text(_items[index].pts,
                                       style: TextStyle(fontSize: 16.0, color: Colors.white)),
                                 ],

                               ),
                             ),
                           );
                         }),
                    )
                   ]),
                 height: mediaQuery.height * 1,
                 decoration: BoxDecoration(
                     color: Colors.grey[200],
                     borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              )
          ]),
        ),
      ),
    );
  }

  void _getLeaderboardData() {
    //  Create dynamic list
    Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _items.add(LeaderboardModel("1","assets/images/profile_pic.png","Ralph Edwards","2590 pts." ));
      _items.add(LeaderboardModel("2","assets/images/profile_pic.png","Savannah Nguyen", "590 pts."));
      _items.add(LeaderboardModel("3","assets/images/profile_pic.png","Ralph Edwards","2590 pts." ));
      _items.add(LeaderboardModel("4","assets/images/profile_pic.png", "Savannah Nguyen", "590 pts."));
      _items.add(LeaderboardModel("5","assets/images/profile_pic.png", "Savannah Nguyen", "590 pts."));
      _items.add(LeaderboardModel("6","assets/images/profile_pic.png", "Ralph Edwards","2590 pts." ));
      _items.add(LeaderboardModel("7","assets/images/profile_pic.png", "Ralph Edwards","2590 pts." ));
      _isLoading = false;
    });
  }


}
