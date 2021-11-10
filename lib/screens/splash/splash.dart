import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/buttons/secondary_button.dart';
import 'dart:async';
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
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }
  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkUser);
  }
Future checkUser() async{
   Navigator.pushNamed(context, '/login');
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
                    'InventChat',
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
                        TyperAnimatedText(
                            "Hyperlocal private chatting".toUpperCase()),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                // Hero(
                //   tag: 'loginbutton',
                //   child: SecondaryButton(
                //     text: Text(
                //       'Login',
                //       style: Theme.of(context)
                //           .textTheme
                //           .button!
                //           .apply(color: AppColors.primaryDark),
                //     ),
                //     onPressed: () {
                //       Navigator.pushReplacementNamed(context, '/login');
                //     },
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Hero(
                //   tag: 'signupbutton',
                //   child: PrimaryButton(
                //     text: Text('Signup',
                //         style: Theme.of(context).textTheme.button!),
                //     onPressed: () {
                //       Navigator.pushReplacementNamed(context, '/signup');
                //     },
                //   ),
                // ),
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
