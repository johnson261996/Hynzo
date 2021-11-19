///Contains all the widgets included in login screen.

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:invent_chat/containers/chat/connected_container.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/utils/localStorage.dart';
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
      LocalStorage.setMobileNumber(mobile);
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
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height:110,
                  ),
                  Hero(
                    tag: 'HeroTitle',
                    child: Text(
                      Strings.TITLE_NAME,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: Image.asset('assets/images/registration.png',fit: BoxFit.contain,),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [AppColors.blue, AppColors.lightblue],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Text(Strings.LOGIN_TITLE,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                    Text(Strings.LOGIN_SUBTITLE,
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Input(
                        hintText: Strings.LOGIN_USER_NUMBER,
                        leading: Image.asset('assets/images/mobile.png'),
                        textInputAction: TextInputAction.done,
                        obscure: false,
                        keyboard: TextInputType.number,
                        onchangeFunc: (val) {
                          setState(() {
                            mobile = val;
                            errorMgs = "";
                          });
                        },
                      ),
                    ),
                    if (errorMgs.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: ErrorText(errorMgs: errorMgs),
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
