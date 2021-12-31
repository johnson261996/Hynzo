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
    return SafeArea(
      child: Container(
        color: AppColors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(children: <Widget>[
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
                "Game Name",
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
              top: mediaQuery.width * 0.35,
              right: mediaQuery.width * 0.35,
              left: mediaQuery.width * 0.35,
              bottom: mediaQuery.width * 0.35,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      color: Colors.white,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: SquareViewWidget(
                    imagePath:
                    'assets/images/chess.png',
                  )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(
                    50.0, mediaQuery.height * 0.4, 50.0, 10),
                child: Image.asset(
                  'assets/images/Play_Button.png',
                )),
          ]),

            Container(
             child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
               Text(
                 'Leaderboard',
                 style: TextStyle(color: Colors.blue, fontSize: 25.0),
               ),
                SingleChildScrollView(
                  child: Expanded(
                    child: ListView.builder(
                       shrinkWrap: true,
                       physics: const ClampingScrollPhysics(),
                       itemCount: _items.length,
                       itemBuilder: (context, index) {
                         return Card(
                           //                           <-- Card widget
                           //color: Colors.orange,
                           color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Text(_items[index].no,
                                     style: TextStyle(fontSize: 16.0, color: Colors.white)),
                                 CircleAvatar(
                                   radius: 30.0,
                                   backgroundImage:
                                   ExactAssetImage(_items[index].img),
                                   backgroundColor: Colors.transparent,
                                 ),
                                 Text(_items[index].title,
                                     style: TextStyle(fontSize: 16.0, color: Colors.white)),
                                 Text(_items[index].pts,
                                     style: TextStyle(fontSize: 16.0, color: Colors.white)),
                               ]
                           ),
                         );
                       }),
                  ),
                )
               ]),
             height: mediaQuery.height * 1,
             width: mediaQuery.width * 1,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(20))),


            )
        ]),
      ),
    );
  }

  void _getLeaderboardData() {
    //  Create dynamic list
    Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _items.add(LeaderboardModel("1","assets/images/profile_pic1.png","Ralph Edwards","2590 pts." ));
      _items.add(LeaderboardModel("2","assets/images/profile_pic1.png","Savannah Nguyen", "590 pts."));
      _items.add(LeaderboardModel("3","assets/images/profile_pic1.png","Ralph Edwards","2590 pts." ));
      _items.add(LeaderboardModel("4","assets/images/profile_pic1.png", "Savannah Nguyen", "590 pts."));
      _items.add(LeaderboardModel("5","assets/images/profile_pic1.png", "Savannah Nguyen", "590 pts."));
      _items.add(LeaderboardModel("6","assets/images/profile_pic1.png", "Ralph Edwards","2590 pts." ));
      _items.add(LeaderboardModel("7","assets/images/profile_pic1.png", "Ralph Edwards","2590 pts." ));
      _isLoading = false;
    });
  }


}
