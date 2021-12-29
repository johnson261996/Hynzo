///Contains all the widgets included in login screen.
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/buttons/primary_button.dart';
import 'package:hynzo/widgets/common/error/error.dart';
import 'package:hynzo/widgets/common/input/input.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginWidget extends StatefulWidget {
  final Function(String, String, String) generateOTP;

  const LoginWidget({Key? key, required this.generateOTP}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late String mobile = '';
  late String fullName = '';
  late String errorMgs = '';
  late String name = '';
  bool signIn = true;
  TextEditingController nameC = TextEditingController(),
      numberC = TextEditingController();

  _generateOTP() async {
    if (mobile.length == 10 && (signIn || fullName.isNotEmpty)) {
      String signature = '';
      SmsAutoFill().getAppSignature.then((signature) {
        signature = signature;
      });
      GenerateOTPModel response =
          await widget.generateOTP(mobile, fullName, signature);
      if (response.message == 'Please make sign up.') {
        ToastUtil()
            .showToast('Account does not exist! Please sign up to continue');
      } else if (response.message == 'OTP is sent to your Contact Number') {
        Navigation.pushNamed(context, Routes.otp);
      }
    } else {
      setState(() {
        if (mobile.length != 10) {
          errorMgs = Strings.PHONE_NUMBER_VALIDATION;
        } else if (fullName.isEmpty) {
          errorMgs = 'Please enter your name';
        }
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
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          width: mediaQuery.width,
          height: mediaQuery.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.08,
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
                    height: mediaQuery.height * 0.03,
                  ),
                  SizedBox(
                    width: mediaQuery.width,
                    height: mediaQuery.height * 0.3,
                    child: Image.asset(
                      'assets/images/registration.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.blue, AppColors.lightblue],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        signIn ? Strings.LOGIN_TITLE : Strings.SIGNUP_TITLE,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .apply(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        signIn
                            ? Strings.LOGIN_SUBTITLE
                            : Strings.SIGNUP_SUBTITLE,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .apply(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!signIn)
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Input(
                            controller: nameC,
                            hintText: Strings.LOGIN_USER_NAME,
                            leading:
                                Image.asset('assets/images/my_account.png'),
                            textInputAction: TextInputAction.done,
                            obscure: false,
                            keyboard: TextInputType.text,
                            onchangeFunc: (val) {
                              setState(() {
                                fullName = val;
                                errorMgs = "";
                              });
                            },
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Input(
                          controller: numberC,
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
                          text: Text(signIn
                              ? Strings.LOGIN_BUTTON
                              : Strings.SIGNUP_BUTTON),
                          onPressed: () {
                            _generateOTP();
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              !signIn
                                  ? 'Already have an account?'
                                  : 'Don\'t have an account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  signIn = !signIn;
                                  nameC.text = fullName;
                                  numberC.text = mobile;
                                });
                              },
                              child: Text(
                                !signIn ? 'Login' : 'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: AppColors.blueDark),
                              ),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
