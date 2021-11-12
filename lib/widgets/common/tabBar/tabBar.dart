///Custom created tab bar for aplication

import 'package:flutter/material.dart';
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
              children: [
                Center(
                    child: Text(Strings.Connected,
                        style: Theme.of(context).textTheme.headline1)),
                Center(
                    child: Text(Strings.Received,
                        style: Theme.of(context).textTheme.headline1)),
                Center(
                    child: Text(Strings.Suggested,
                        style: Theme.of(context).textTheme.headline1))
              ],
              controller: _tabController,
            ))
          ],
        )),
        //
      );
}
