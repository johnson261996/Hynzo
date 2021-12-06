///Main screen of Application.

import 'package:flutter/material.dart';
import 'package:hynzo/containers/home_conatiner.dart';

class HomeScreen extends StatelessWidget {
  final Function _onTapped;
  const HomeScreen(this._onTapped,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContainer(_onTapped),
    );
  }
}
