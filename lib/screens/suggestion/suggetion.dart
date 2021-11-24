import 'package:flutter/material.dart';
import 'package:invent_chat/containers/suggestion_container.dart';

class Suggetion extends StatelessWidget{
  const Suggetion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuggetionConatiner(),
    );
  }

}