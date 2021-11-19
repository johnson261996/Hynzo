///Contains all the widgets added in Otp verification screen.

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/utils/localStorage.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';
import 'package:invent_chat/widgets/common/error/error.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/resources/strings.dart';

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
  late Timer _timer;
  String time = '';
  int _start = 60;
  bool isTimerStarted = false;
  bool isTimerFinished=false;

  @override
  void initState() {
    super.initState();
    SmsAutoFill().listenForCode;
    if (!isTimerStarted) startTimer();
    LocalStorage.getMobileNumber().then((value) => phone = value!);
  }

  void startTimer() {
    isTimerStarted = !isTimerStarted;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            isTimerFinished=true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            time = getTimeFormat(_start);
          });
        }
      },
    );
  }

  String getTimeFormat(int time) {
    if (time < 10) {
      return '00:0$time';
    }
    return '00:$time';
  }

  @override
  void dispose() {
    _timer.cancel();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  verifyOTP() async {
    if (otp.length == 6) {
      widget.verifyOTP(otp);
      Navigator.pushNamed(context, Routes.onboarding);
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
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back,size: 25,color: AppColors.gray,),
                ),
                Expanded(child: Image.asset('assets/images/otp.png',fit: BoxFit.contain,width: 500,height: 500,),),
              ],
            ),
          ),
          Text(Strings.OTP_HEADING,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('On number',style: Theme.of(context).textTheme.bodyText2 ,),
              Text(' $phone',style: Theme.of(context).textTheme.caption,),
              if(isTimerFinished)...[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isTimerStarted=false;
                      isTimerFinished=false;
                      _start = 60;
                    });
                  },
                  child: Text(' Resend',style: Theme.of(context).textTheme.caption,),
                )
              ] else...[
                Text(' Resend Code in ',style: Theme.of(context).textTheme.bodyText2 ,),
                Text(' $time',style: Theme.of(context).textTheme.caption,),
              ],
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
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
                    errorMgs == "" ? AppColors.primaryLight : AppColors.error,
                    errorMgs == "" ? AppColors.primaryLight : AppColors.error),
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
                if(code.length == 6) {
                  verifyOTP();
                }
              },
              codeLength: 6 //code length, default 6
              ),
          if (errorMgs.isNotEmpty) ErrorText(errorMgs: errorMgs),
        ],
      ),
    );
  }
}
