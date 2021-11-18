import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invent_chat/resources/strings.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';
import 'package:invent_chat/widgets/common/input/input.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignUpWidget extends StatefulWidget {
  final Function generateOTP;

  const SignUpWidget({Key? key, required this.generateOTP}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.10,),
                Hero(
                  tag: 'HeroTitle',
                  child: Text(
                    Strings.TITLE_NAME,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Container(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.50,
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
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          Strings.HI_TEXT,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          Strings.LETS_STARTED,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Input(
                            hintText: Strings.LOGIN_USER_NAME,
                            leading: Icons.account_circle_outlined,
                            obscure: false,
                            keyboard: TextInputType.text,
                            onchangeFunc: (val) {
                              setState(() {
                                name = val;
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
                            hintText: Strings.LOGIN_USER_NUMBER,
                            leading: Icons.phone_outlined,
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
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Hero(
                            tag: 'signupbutton',
                            child: PrimaryButton(
                              text: const Text(Strings.SIGN_UP_BUTTON),
                              onPressed: () {
                                _generateOTP();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.ALREADY_LOGIN,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, Routes.login);
                          },
                          child: Text(
                            Strings.LOGIN,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
