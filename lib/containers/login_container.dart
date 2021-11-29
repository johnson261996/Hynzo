/// Contains service and logic related of login screen.
///
///

import 'package:flutter/material.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/widgets/auth/login_widget.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatelessWidget {
  static AuthProvider? _authProvider;

  const LoginContainer({Key? key}) : super(key: key);

  Future<GenerateOTPModel> _generateOTP(String mobile, String signature) async {
    _authProvider!.changeLoadingStatus(true); // change loading status to true
    final GenerateOTPModel response =
        await _authProvider!.generateOTP(mobile, signature);
    _authProvider!.changeLoadingStatus(false); // change loading status to false
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
