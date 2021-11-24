/// Contains service and logic related of home screen.
///
///

import 'package:flutter/material.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/widgets/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer> {
  LogOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: HomeWidget(
      logout: LogOut,
    ));
  }
}
