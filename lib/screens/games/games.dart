///Game section for user.

import 'package:flutter/material.dart';
import 'package:hynzo/containers/game_container.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GameContainer(),
    );
  }
}
