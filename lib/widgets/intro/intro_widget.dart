import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localStorage.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  int state = 0;

  Widget _getContinueButtonWidget(int state) {
    if (state == 0) {
      return Image.asset(
        'assets/images/first_button.png',
        fit: BoxFit.contain,
      );
    } else if (state == 1) {
      return Image.asset(
        'assets/images/second_button.png',
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        'assets/images/third_button.png',
        fit: BoxFit.contain,
      );
    }
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
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            width: 300,
            height: 300,
            child: _getImage(state),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            getText(state),
            style: Theme.of(context)
                .textTheme
                .headline3!
                .apply(color: AppColors.blueDark),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
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
          const SizedBox(
            height: 35,
          ),
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
              width: 70,
              height: 70,
              child: _getContinueButtonWidget(state),
            ),
          ),
        ],
      ),
    );
  }
}
