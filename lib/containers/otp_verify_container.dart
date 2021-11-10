import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/auth_model.dart';
import 'package:invent_chat/providers/auth_provider.dart';
import 'package:invent_chat/widgets/auth/login_widget.dart';
import 'package:invent_chat/widgets/auth/otp_verify_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerifyContainer extends StatelessWidget {
  static AuthProvider? _authProvider;
  const OtpVerifyContainer({Key? key}) : super(key: key);

  Future<LoginModel> _verifyOtp(String mobile,String code,String otp_id,String otp) async {
    _authProvider!.changeLoadingStatus(true); // change loading status to true
    final LoginModel response = await _authProvider!.verifyOtp(mobile,code,otp_id,otp);
    _authProvider!.changeLoadingStatus(false); // change loading status to false

    return response;

  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return OtpWidget(
      verifyOTP: _verifyOtp,
    );
  }
}
