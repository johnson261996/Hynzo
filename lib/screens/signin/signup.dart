import 'package:flutter/material.dart';
import 'package:invent_chat/containers/signup_container.dart';

class Signup extends StatelessWidget{

  const Signup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold( body:  SignUpContainer(),);
  }

}