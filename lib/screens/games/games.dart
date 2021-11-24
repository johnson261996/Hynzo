///Game section for user.

import 'package:flutter/material.dart';
import 'package:invent_chat/containers/game_container.dart';
import 'package:invent_chat/resources/strings.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GameContainer(),
    );
  }
}
