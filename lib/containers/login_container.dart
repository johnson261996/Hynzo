/// Contains service and logic related of login screen.
///
///

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/auth/login_widget.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatefulWidget {

  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  bool _isLoading = false;
  static AuthProvider? _authProvider;

  Future<void> _generateOTP(String mobile, String signature) async {
    try{
      setState(() {
        _isLoading = true;
      });
      final GenerateOTPModel response =
      await _authProvider!.generateOTP(mobile, signature);
      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 200) {
        LocalStorage.setMobileNumber(mobile);
        Navigation.pushNamed(context, Routes.otp);
      } else {
        ToastUtil().showToast('Something went wrong!');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: LoginWidget(
        generateOTP: _generateOTP,
      ),
    );
  }
}
