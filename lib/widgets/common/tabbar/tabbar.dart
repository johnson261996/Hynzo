///Custom created tab bar for aplication

import 'package:flutter/material.dart';
import 'package:hynzo/containers/chat/connected_container.dart';
import 'package:hynzo/containers/chat/recieved_container.dart';
import 'package:hynzo/containers/chat/suggested_container.dart';
import 'package:hynzo/screens/home/home.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/resources/strings.dart';

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
