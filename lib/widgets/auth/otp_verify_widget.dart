///Contains all the widgets added in Otp verification screen.

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/connectivity.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/buttons/primary_button.dart';
import 'package:hynzo/widgets/common/error/error.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/resources/strings.dart';

class OtpWidget extends StatefulWidget {
  final Function verifyOTP;
  final Function resendOTP;

  const OtpWidget({
    Key? key,
    required this.verifyOTP,
    required this.resendOTP,
  }) : super(key: key);

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
  bool isTimerFinished = false;

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
            isTimerFinished = true;
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
      return '0${time}s';
    }
    return '${time}s';
  }

  @override
  void dispose() {
    _timer.cancel();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  verifyOTP() {
    ConnectionStaus().check().then((connectionStatus) {
      if (connectionStatus) {
        if (otp.length == 6) {
          FocusScope.of(context).unfocus();
          widget.verifyOTP(otp);
        } else {
          setState(() {
            errorMgs = Strings.PHONE_NUMBER_VALIDATION;
          });
        }
      } else {
        ToastUtil().showToast("No internet connection available. Please check your connection or try again later.");
      }
    });
  }

  resendOTP() {
    FocusScope.of(context).unfocus();
    ConnectionStaus().check().then((connectionStatus) {
      if (connectionStatus) {
        String signature = '';
        SmsAutoFill().getAppSignature.then((signature) {
          signature = signature;
        });
        widget.resendOTP(phone, signature);
      } else {
        ToastUtil().showToast("No internet connection available. Please check your connection or try again later.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      width: mediaQuery.width,
      padding: const EdgeInsets.all(30),
      height: mediaQuery.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.height * 0.06,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: AppColors.gray,
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.06,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              Strings.OTP_HEADING,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Row(
            children: [
              Text(
                'A verification code has been sent to',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                ' $phone',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.05,
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
                if (code.length == 6) {
                  verifyOTP();
                }
              },
              codeLength: 6 //code length, default 6
              ),
          if (errorMgs.isNotEmpty) ErrorText(errorMgs: errorMgs),
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          if (isTimerFinished) ...[
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  resendOTP();
                  setState(() {
                    isTimerStarted = false;
                    isTimerFinished = false;
                    _start = 60;
                  });
                  startTimer();
                },
                child: Text(
                  ' Resend',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .apply(color: AppColors.lightblue),
                ),
              ),
            )
          ] else ...[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' Resend in $time',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
