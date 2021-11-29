/// This is the Model Structure for News Response.
///
///

class GenerateOTPModel {
  final String? message;
  final int? otpVerificationId;
  final int? statusCode;

  const GenerateOTPModel({
    this.message,
    this.otpVerificationId,
    this.statusCode,
  });

  factory GenerateOTPModel.fromJson(Map<String, dynamic> json, int code) {
    return GenerateOTPModel(
      message: json['message'],
      otpVerificationId: json['otp_verification_id'],
      statusCode: code,
    );
  }
}

class LoginModel {
  final String? token;
  final Map? user;
  final int? statusCode;

  const LoginModel({
    this.token,
    this.user,
    this.statusCode,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json, int code) {
    return LoginModel(
      token: json['token'],
      user: json['user'],
      statusCode: code,
    );
  }
}
