/// Contains service and logic related of otp verification screen.
///
///

import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/auth_model.dart';
import 'package:invent_chat/providers/auth_provider.dart';
import 'package:invent_chat/widgets/auth/otp_verify_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerifyContainer extends StatelessWidget {
  static AuthProvider? _authProvider;

  const OtpVerifyContainer({Key? key}) : super(key: key);

  Future<LoginModel> _verifyOtp(otp) async {
    _authProvider!.changeLoadingStatus(true); // change loading status to true
    final LoginModel response = await _authProvider!
        .verifyOtp(_authProvider!.userMobile, "91", _authProvider!.otpId, otp);
    _authProvider!.changeLoadingStatus(false); // change loading status to false
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', response.token.toString());
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return OtpWidget(
      verifyOTP: _verifyOtp,
      authProvider: _authProvider,
    );
  }
}
