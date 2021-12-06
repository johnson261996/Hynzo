import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/resources/strings.dart';

/// [SplashScreen] is the initial screen that loads into the app.
/// This screen will check whether the User is logged in already.
/// [SplashScreen] will allow the user to land on walkthrough screen if the users for the first time
/// If already installed and already logged in then user will be navigated to dashboard else login

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;
  late bool introStatus;
  late String token;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkAuth);
  }

  checkAuth() async {
    await LocalStorage.getIntroStatus().then((value) => introStatus = value!);
    await LocalStorage.getLoginToken().then((value) => token = value!);
    if (introStatus) {
      Navigation.pushReplacementNamed(context, Routes.intro);
    } else {
      if (token == "") {
        Navigation.pushReplacementNamed(context, Routes.login);
      } else {
        Navigation.pushReplacementNamed(context, Routes.navScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mainAnimation.value,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'heroicon',
                  child: Icon(
                    Icons.textsms,
                    size: 100,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Hero(
                  tag: 'HeroTitle',
                  child: Text(
                    Strings.TITLE_NAME,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.subtitle1!,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(Strings.SPLASH_TEXT),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
