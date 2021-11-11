///Custom created tab bar for aplication

import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';

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
                  Tab(text: 'Connected'),
                  Tab(text: 'Received'),
                  Tab(text: 'Suggested')
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.primaryLight,
              ),
            ),
            Expanded(
                child: TabBarView(
              children: const [
                Center(
                    child: Text('Connected', style: TextStyle(fontSize: 20))),
                Center(child: Text('Received', style: TextStyle(fontSize: 20))),
                Center(child: Text('Suggested', style: TextStyle(fontSize: 20)))
              ],
              controller: _tabController,
            ))
          ],
        )),
        //
      );
}
