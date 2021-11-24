import 'package:flutter/material.dart';
import 'package:hynzo/containers/intro_container.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroContainer(),
    );
  }
}
