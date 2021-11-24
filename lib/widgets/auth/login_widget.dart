///Contains all the widgets included in login screen.

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/containers/chat/connected_container.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:hynzo/widgets/common/buttons/primary_button.dart';
import 'package:hynzo/widgets/common/error/error.dart';
import 'package:hynzo/widgets/common/input/input.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/resources/strings.dart';

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
  bool isLoading = false;

  _generateOTP() async {
    if (mobile.length == 10) {
      setState(() {
        isLoading = true;
      });
      String signature = '';
      SmsAutoFill().getAppSignature.then((signature) {
        signature = signature;
      });
      widget.generateOTP(mobile, signature);
      LocalStorage.setMobileNumber(mobile);
      setState(() {
        isLoading = false;
      });
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
        color: AppColors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  Hero(
                    tag: 'HeroTitle',
                    child: Text(
                      Strings.TITLE_NAME,
                      style: Theme.of(context).textTheme.button!.apply(
                            color: AppColors.grayDark,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: Image.asset(
                      'assets/images/registration.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.52,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [AppColors.blue, AppColors.lightblue],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Text(
                      Strings.LOGIN_TITLE,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .apply(color: AppColors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      Strings.LOGIN_SUBTITLE,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .apply(color: AppColors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
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
