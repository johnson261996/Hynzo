///Login screen for Authentication.


import 'package:flutter/material.dart';
import 'package:invent_chat/containers/login_container.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginContainer());
  }
}
