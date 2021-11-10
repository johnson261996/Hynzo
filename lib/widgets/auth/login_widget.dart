import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';
import 'package:invent_chat/widgets/common/error/error.dart';
import 'package:invent_chat/widgets/common/input/input.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginWidget extends StatefulWidget {
  final Function generateOTP;
  const LoginWidget({Key? key, required this.generateOTP}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late String mobile = '';
  late String errorMgs = '';

  _generateOTP() {
    if (mobile.length == 10) {
      String signature = '';
      SmsAutoFill().getAppSignature.then((signature) {
        signature = signature;
      });
      widget.generateOTP(mobile, signature);
    } else {
      setState(() {
        errorMgs = 'Please enter valid mobile number';
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
            Input(
              hintText: 'Enter Mobile Number',
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
                text: const Text('login'),
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
