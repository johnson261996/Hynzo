import 'package:flutter/material.dart';
import 'package:invent_chat/containers/interest_container.dart';

class Interest extends StatelessWidget{
  const Interest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InterestContainer(),
    );
  }

}