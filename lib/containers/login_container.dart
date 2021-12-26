import 'package:flutter/material.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/auth/login_widget.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  AuthProvider? _authProvider;

  Future<GenerateOTPModel> _generateOTP(
      String mobile, String name, String signature) async {
    final GenerateOTPModel response =
        await _authProvider!.generateOTP(mobile, name, signature);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return LoadingOverlay(
      isLoading: _authProvider!.isLoading,
      color: AppColors.gray,
      child: LoginWidget(
        generateOTP: _generateOTP,
      ),
    );
  }
}
