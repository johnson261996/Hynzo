///Edit more and settings screen for user

import 'package:flutter/material.dart';
import 'package:hynzo/containers/more_container.dart';
import 'package:hynzo/resources/strings.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoreContainer(),
    );
  }
}
