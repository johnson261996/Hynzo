import 'package:flutter/material.dart';
import 'package:invent_chat/containers/intro_container.dart';

class Intro extends StatelessWidget{
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroContainer(),
    );
  }

}