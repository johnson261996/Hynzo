/// Contains service and logic related of otp verification screen.
///
///

import 'package:flutter/material.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/auth/otp_verify_widget.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as devlog;

class OtpVerifyContainer extends StatefulWidget {
  static AuthProvider? _authProvider;

  const OtpVerifyContainer({Key? key}) : super(key: key);

  @override
  State<OtpVerifyContainer> createState() => _OtpVerifyContainerState();
}

class _OtpVerifyContainerState extends State<OtpVerifyContainer> {
  bool _isLoading = false;


  Future<void> _verifyOtp(otp) async {
    setState(() {
      _isLoading = true;
    });
    OtpVerifyContainer._authProvider!.changeLoadingStatus(true); // change loading status to true
    final LoginModel response = await OtpVerifyContainer._authProvider!
        .verifyOtp(OtpVerifyContainer._authProvider!.userMobile, "91", OtpVerifyContainer._authProvider!.otpId, otp);
    OtpVerifyContainer._authProvider!.changeLoadingStatus(false); // change loading status to false
    devlog.log("$response", name: 'MyLog');
    setState(() {
      _isLoading = false;
    });
    if(response.statusCode == 200) {
      LocalStorage.setLoginToken(response.token.toString());
      LocalStorage.clearMobileNumber();
      Navigator.pushReplacementNamed(context, Routes.interest);
    } else {
      ToastUtil().showToast('Invalid Otp');
    }
  }

  Future<void> _resendOTP(String mobile, String signature) async {
    setState(() {
      _isLoading = true;
    });
    OtpVerifyContainer._authProvider!
        .changeLoadingStatus(true); // change loading status to true
    final GenerateOTPModel response =
    await OtpVerifyContainer._authProvider!.generateOTP(mobile, signature);
    OtpVerifyContainer._authProvider!
        .changeLoadingStatus(false); // change loading status to false
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      ToastUtil().showToast("Otp has been resend to your mobile number successfully.");
    } else {
      ToastUtil().showToast('Something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    OtpVerifyContainer._authProvider = Provider.of<AuthProvider>(context);
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: OtpWidget(
        verifyOTP: _verifyOtp,
        resendOTP: _resendOTP,
      ),
    );
  }
}
