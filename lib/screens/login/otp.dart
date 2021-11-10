import 'package:flutter/material.dart';
import 'package:invent_chat/containers/login_container.dart';
import 'package:invent_chat/containers/otp_verify_container.dart';

class Otpverify extends StatelessWidget {
  const Otpverify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OtpVerifyContainer());
  }
}

