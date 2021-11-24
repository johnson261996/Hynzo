///Chat screen for user
///Shows all the connected users, received requests and suggested users.

import 'package:flutter/material.dart';
import 'package:hynzo/widgets/common/tabBar/tabBar.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: CustomTabBar(),
    );
  }
}
