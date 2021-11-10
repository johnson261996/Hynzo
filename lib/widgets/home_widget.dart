///Widget created for home screen.

import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final Function logout;

  const HomeWidget({
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(60)),
              Text(
                'Home',
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(onPressed: () => logout(), child: Text('LogOut'))
            ],
          ),
        ),
      ),
    ));
    ;
  }
}
