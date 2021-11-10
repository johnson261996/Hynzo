///Widget created for onboarding screen.

import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final Function next;

  const OnboardingWidget({
    required this.next,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Options',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () => next(), child: Text('Next'))
          ],
        ),
      ),
    ));
  }
}
