///Contains all the widgets included in login screen.

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';
import 'package:invent_chat/widgets/common/error/error.dart';
import 'package:invent_chat/widgets/common/input/input.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/resources/strings.dart';
class LoginWidget extends StatefulWidget {
  final Function generateOTP;

  const LoginWidget({Key? key, required this.generateOTP}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late String mobile = '';
  late String errorMgs = '';
  late String name = '';

  _generateOTP() async {
    if (mobile.length == 10) {
      String signature = '';
      SmsAutoFill().getAppSignature.then((signature) {
        signature = signature;
      });
      widget.generateOTP(mobile, signature);
      Navigator.pushNamed(context, Routes.otp);
    } else {
      setState(() {
        errorMgs = Strings.PHONE_NUMBER_VALIDATION;
      });
    }
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height,
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
                    TyperAnimatedText(
                        Strings.SPLASH_TEXT),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Input(
              hintText: Strings.LOGIN_USER_NAME,
              leading: Icons.account_circle,
              obscure: false,
              keyboard: TextInputType.text,
              onchangeFunc: (val) {
                setState(() {
                  name = val;
                  errorMgs = "";
                });
              },
            ),
            Input(
              hintText: Strings.LOGIN_USER_NUMBER,
              leading: Icons.phone,
              obscure: false,
              keyboard: TextInputType.number,
              onchangeFunc: (val) {
                setState(() {
                  mobile = val;
                  errorMgs = "";
                });
              },
            ),
            ErrorText(errorMgs: errorMgs),
            const SizedBox(
              height: 30,
            ),
            Hero(
              tag: 'loginbutton',
              child: PrimaryButton(
                text: const Text(Strings.LOGIN_BUTTON),
                onPressed: () {
                  _generateOTP();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
