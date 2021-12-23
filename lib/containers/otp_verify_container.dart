/// Contains service and logic related of otp verification screen.
///
///
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hynzo/core/models/auth_model.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/providers/interest_provider.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/auth/otp_verify_widget.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';

class OtpVerifyContainer extends StatefulWidget {
  const OtpVerifyContainer({Key? key}) : super(key: key);

  @override
  State<OtpVerifyContainer> createState() => _OtpVerifyContainerState();
}

class _OtpVerifyContainerState extends State<OtpVerifyContainer> {
  bool _isLoading = false;
  bool _isAlreadyInterestAdded = false;
  late String token;
  int offSet = 0;
  static AuthProvider? _authProvider;
  static InterestProvider? _interestProvider;

  Future<void> _verifyOtp(String otp) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final LoginModel response = await _authProvider!.verifyOtp(
          _authProvider!.userMobile, "91", _authProvider!.otpId, otp);
      if (response.statusCode == 200) {
        token = response.token!;
        LocalStorage.setLoginToken(token);
        LocalStorage.setUserID(response.user!.id!);
        LocalStorage.setUserName(response.user!.username!);
        LocalStorage.setUserFullName(response.user!.fullName!);
        LocalStorage.setProfilePic(response.user!.avatar!);
        _getInterestForSpecificUser("10", offSet.toString());
      } else {
        ToastUtil().showToast('Invalid Otp');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<void> _getInterestForSpecificUser(String limit, String offset) async {
    try {
      InterestResponseModel interestResponseModel =
          await _interestProvider!.getInterestList(limit, offset);
      if (interestResponseModel.statusCode == 200) {
        for (var element in interestResponseModel.resultsList) {
          if (element.isSelected!) {
            _isAlreadyInterestAdded = true;
            break;
          }
        }
        if (_isAlreadyInterestAdded) {
          setState(() {
            _isLoading = false;
          });

          Navigation.pushReplacementNamed(context, Routes.navScreen);
        } else {
          if (interestResponseModel.next! != '') {
            offSet = offSet + 10;
            _getInterestForSpecificUser("10", offSet.toString());
          } else {
            setState(() {
              _isLoading = false;
            });
            Navigation.pushReplacementNamed(context, Routes.interest);
          }
        }
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<void> _resendOTP(String mobile, String signature) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final GenerateOTPModel response =
          await _authProvider!.resendOtp(mobile, signature);
      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 200) {
        ToastUtil().showToast(
            "Otp has been resend to your mobile number successfully.");
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
    _interestProvider = Provider.of<InterestProvider>(context);
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
