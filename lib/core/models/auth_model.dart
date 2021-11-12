/// This is the Model Structure for News Response.
///
///

class GenerateOTPModel {
  final String? message;
  final int? otpVerificationId;

  const GenerateOTPModel({
    this.message,
    this.otpVerificationId,
  });

  factory GenerateOTPModel.fromJson(Map<String, dynamic> json, int code) {
    return GenerateOTPModel(
      message: json['message'],
      otpVerificationId: json['otp_verification_id'],
    );
  }
}

class LoginModel {
  final String? token;
  final Map? user;

  const LoginModel({
    this.token,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json, int code) {
    return LoginModel(
      token: json['token'],
      user: json['user'],
    );
  }
}
