///Widget created for onboarding screen.

import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';

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
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(60)),
              Text(
                Strings.ON_BOARDING,
                style: Theme.of(context).textTheme.headline1,
              ),
              ElevatedButton(onPressed: () => next(), child: Text(Strings.NEXT))
            ],
          ),
        ),
      ),
    ));
  }
}
