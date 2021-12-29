import 'package:flutter/material.dart';
import 'package:hynzo/containers/settings_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsContainer(),
    );
  }
}
