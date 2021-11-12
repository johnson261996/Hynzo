/// Contains service and logic related of onboarding screen.
///
///

import 'package:flutter/material.dart';
import 'package:invent_chat/widgets/onboarding_widget.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboardingcontainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Onboardingcontainer();
  }
}

class _Onboardingcontainer extends State<Onboardingcontainer> {
  next() async {
    Navigator.pushNamed(context, Routes.navScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: OnboardingWidget(
      next: next,
    ));
  }
}
