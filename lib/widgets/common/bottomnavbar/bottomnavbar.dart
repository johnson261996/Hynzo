///Custom created Bottom navigtaion bar for application
import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/screens/chat/chat_screen.dart';
import 'package:hynzo/screens/events/events.dart';
import 'package:hynzo/screens/games/games.dart';
import 'package:hynzo/screens/home/home.dart';
import 'package:hynzo/screens/more/more.dart';
import 'package:hynzo/themes/colorrt';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

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
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          HomeScreen(onTapped),
          const ChatScreen(),
          const News(isBackEnable: false),
          const GameScreen(),
          const MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.blueDark,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: Strings.HOME,
            icon: Image.asset(
              'assets/images/home_inactive.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            activeIcon: Image.asset(
              'assets/images/home_active.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.CHAT,
            icon: Image.asset(
              'assets/images/message_inactive.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            activeIcon: Image.asset(
              'assets/images/message_active.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.NEWS,
            icon: Image.asset(
              'assets/images/events_inactive.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            activeIcon: Image.asset(
              'assets/images/events_active.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.GAMES,
            icon: Image.asset(
              'assets/images/game_inactive.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            activeIcon: Image.asset(
              'assets/images/game_active.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.MORE,
            icon: Image.asset(
              'assets/images/more_inactive.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            activeIcon: Image.asset(
              'assets/images/more_active.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ],
        onTap: onTapped,
      ),
    );
  }
}
