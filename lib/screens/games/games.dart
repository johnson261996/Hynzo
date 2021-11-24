///Game section for user.

import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(Strings.GAMES, style: Theme.of(context).textTheme.headline1),
    ));
  }
}
