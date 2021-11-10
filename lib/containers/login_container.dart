/// Contains service and logic related of login screen.
///
///

import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/auth_model.dart';
import 'package:invent_chat/providers/auth_provider.dart';
import 'package:invent_chat/widgets/auth/login_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginContainer extends StatelessWidget {
  static AuthProvider? _authProvider;

  const LoginContainer({Key? key}) : super(key: key);

  Future<GenerateOTPModel> _generateOTP(String mobile, String signature) async {
    _authProvider!.changeLoadingStatus(true); // change loading status to true
    final GenerateOTPModel response =
        await _authProvider!.generateOTP(mobile, signature);
    _authProvider!.changeLoadingStatus(false); // change loading status to false

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('otp_id', response.otpVerificationId.toString());

    return response;
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return LoginWidget(
      generateOTP: _generateOTP,
    );
  }
}
