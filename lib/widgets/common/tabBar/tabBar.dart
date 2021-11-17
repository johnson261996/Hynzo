///Custom created tab bar for aplication

import 'package:flutter/material.dart';
import 'package:invent_chat/containers/chat/connected_container.dart';
import 'package:invent_chat/containers/chat/recieved_container.dart';
import 'package:invent_chat/containers/chat/suggested_container.dart';
import 'package:invent_chat/screens/home/home.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/resources/strings.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  var tabs = [];
  late TabController _tabController;

  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
            child: Column(
          children: [
            Container(
              child: TabBar(
                labelColor: Colors.black,
                tabs: const [
                  Tab(text: Strings.Connected),
                  Tab(text: Strings.Received),
                  Tab(text: Strings.Suggested)
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.primaryLight,
              ),
            ),
            Expanded(
                child: TabBarView(
              children: <Widget>[
               ConnectedContainer(),
                ReceivedContainer(),
                SuggestedContainer()
              ],
              controller: _tabController,
            ))
          ],
        )),
        //
      );
}
