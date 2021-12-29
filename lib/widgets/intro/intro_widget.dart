import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  int state = 0;

  double _setProgressvalue() {
    double value = ((state + 1) / 4).toDouble();
    String progressValue = value.toStringAsFixed(1);
    return double.parse(progressValue);
  }

  Widget _getImage(int state) {
    if (state == 0) {
      return Image.asset(
        'assets/images/new_user_image_one.png',
        fit: BoxFit.contain,
      );
    } else if (state == 1) {
      return Image.asset(
        'assets/images/new_user_image_two.png',
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        'assets/images/new_user_image_three.png',
        fit: BoxFit.contain,
      );
    }
  }

  String getText(int state) {
    if (state == 0) {
      return Strings.CONNECT_FRIENDS;
    } else if (state == 1) {
      return Strings.PLAY_GAMES;
    } else {
      return Strings.EXPLORE_LOCALITY;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: size.height * 0.3,
            height: size.height * 0.3,
            child: _getImage(state),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                        begin: const Offset(0.0, -0.8),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
              );
            },
            child: Text(
              getText(state),
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .apply(color: AppColors.blueDark),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                        begin: const Offset(0.0, -0.8),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                Strings.DUMMY_TEXT,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                if (state == 0) {
                  state = 1;
                } else if (state == 1) {
                  state = 2;
                } else {
                  LocalStorage.setIntroStatus(false);
                  Navigator.pushReplacementNamed(context, Routes.login);
                }
              });
            },
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.only(
                right: 20,
                bottom: 20,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    width: 70.0,
                    height: 70.0,
                    child: CircularProgressIndicator(
                      value: _setProgressvalue(),
                      backgroundColor: AppColors.blueGray,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.blueDark,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/next_button.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
