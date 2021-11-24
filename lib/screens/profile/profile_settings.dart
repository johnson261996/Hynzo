///Edit profile and settings screen for user

import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(Strings.PROFILE_SETTINGS,
          style: Theme.of(context).textTheme.headline1),
    ));
  }
}
