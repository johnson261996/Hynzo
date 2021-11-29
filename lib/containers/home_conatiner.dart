/// Contains service and logic related of home screen.
///
///

import 'package:flutter/material.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:hynzo/widgets/home_widget.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer> {
  /*logOut() async {
    LocalStorage.clearToken();
    Navigator.pushReplacementNamed(context, Routes.login);
  }*/

  @override
  Widget build(BuildContext context) {
    return HomeWidget(/*logout: logOut,*/);
  }
}
