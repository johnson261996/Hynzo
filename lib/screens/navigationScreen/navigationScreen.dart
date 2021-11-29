///Navigation screen after authentication
import 'package:flutter/material.dart';
import 'package:hynzo/widgets/common/bottomNavBar/bottomnavbar.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
