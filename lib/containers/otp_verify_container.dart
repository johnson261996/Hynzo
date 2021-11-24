/// Contains service and logic related of otp verification screen.
///
///

import 'package:flutter/material.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:hynzo/widgets/auth/otp_verify_widget.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as devlog;

class OtpVerifyContainer extends StatelessWidget {
  static AuthProvider? _authProvider;

  const OtpVerifyContainer({Key? key}) : super(key: key);

  Future<LoginModel> _verifyOtp(otp) async {
    _authProvider!.changeLoadingStatus(true); // change loading status to true
    final LoginModel response = await _authProvider!
        .verifyOtp(_authProvider!.userMobile, "91", _authProvider!.otpId, otp);
    _authProvider!.changeLoadingStatus(false); // change loading status to false
    LocalStorage.setLoginToken(response.token.toString());
    devlog.log("$response", name: 'MyLog');
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
