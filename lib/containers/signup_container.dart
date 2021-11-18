import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/auth_model.dart';
import 'package:invent_chat/providers/auth_provider.dart';
import 'package:invent_chat/widgets/auth/signup_widget.dart';
import 'package:provider/provider.dart';

class SignUpContainer extends StatelessWidget{
  static AuthProvider? _authProvider;

  const SignUpContainer({Key? key}) : super(key: key);

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
      return SignUpWidget(
        generateOTP: _generateOTP,
      );
  }

}