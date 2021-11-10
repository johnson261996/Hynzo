///Contains all the widgets added in Otp verification screen.


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';
import 'package:invent_chat/widgets/common/error/error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpWidget extends StatefulWidget {
  final Function verifyOTP;
  final authProvider;

  const OtpWidget({Key? key, required this.verifyOTP, this.authProvider})
      : super(key: key);

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late String otp = '';
  late String errorMgs = '';
  late String phone = '';
  late String otpId = '';

  @override
  void initState() {
    super.initState();
    SmsAutoFill().listenForCode;
  }

  verifyOTP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      phone = pref.getString('phone')!;

      otpId = pref.getString('otp_id')!;
    });

    if (otp.length == 6) {
      widget.verifyOTP(otp);
      Navigator.pushReplacementNamed(context, '/home');
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
    return Scaffold(
      body: Container(
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
              PinFieldAutoFill(
                  keyboardType: const TextInputType.numberWithOptions(),
                  textInputAction: TextInputAction.done,
                  decoration: BoxLooseDecoration(
                    bgColorBuilder:
                        PinListenColorBuilder(AppColors.white, AppColors.white),
                    gapSpace: 22,
                    radius: const Radius.circular(3.0),
                    strokeColorBuilder: PinListenColorBuilder(
                        errorMgs == ""
                            ? AppColors.primaryLight
                            : AppColors.error,
                        errorMgs == ""
                            ? AppColors.primaryLight
                            : AppColors.error),
                  ),
                  cursor: Cursor(color: AppColors.black, width: 3, height: 3),
                  autoFocus: true,
                  currentCode: otp,
                  onCodeChanged: (code) {
                    if (code!.isNotEmpty) {
                      setState(() {
                        otp = code.toString();
                        errorMgs = "";
                      });
                    }
                  },
                  codeLength: 6 //code length, default 6
                  ),
              ErrorText(errorMgs: errorMgs),
              const SizedBox(
                height: 30,
              ),
              Hero(
                tag: 'verifyOTP',
                child: PrimaryButton(
                  text: const Text('Submit'),
                  onPressed: () {
                    verifyOTP();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
