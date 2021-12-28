import 'package:flutter/material.dart';
import 'package:hynzo/containers/Profile_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    return ProfileContainer(args: args,);
  }
}
