/// Contains service and logic related of home screen.
///
///

import 'package:flutter/material.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/utils/localStorage.dart';
import 'package:invent_chat/widgets/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer> {
  logOut() async {
    LocalStorage.clearToken();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: HomeWidget(
      logout: logOut,
    ));
  }
}
