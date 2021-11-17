///Custom created Bottom navigtaion bar for application

import 'package:flutter/material.dart';
import 'package:invent_chat/screens/chat/chat_screen.dart';
import 'package:invent_chat/screens/games/games.dart';
import 'package:invent_chat/screens/home/home.dart';
import 'package:invent_chat/screens/profile/profile_settings.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/resources/strings.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          HomeScreen(),
          GameScreen(),
          ChatScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryDark,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: Strings.HOME,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: Strings.GAMES,
            icon: Icon(Icons.games),
          ),
          BottomNavigationBarItem(
            label: Strings.CHAT,
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: Strings.PROFILE,
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: onTapped,
      ),
    );
  }
}
