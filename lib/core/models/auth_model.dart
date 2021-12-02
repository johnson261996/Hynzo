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
  final User? user;
  final int? statusCode;

  const LoginModel({
    this.token,
    this.user,
    this.statusCode,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json, int code) {
    return LoginModel(
      token: json['token'],
      user: User.fromJson(json['user']),
      statusCode: code,
    );
  }
}

class User {
  final int? id;
  final String? avatar;
  final String? username;
  final String? fullName;
  final bool? emailVerified;
  final bool? contactNumberVerified;

  User({
    this.id,
    this.avatar,
    this.username,
    this.fullName,
    this.emailVerified,
    this.contactNumberVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      avatar: json['avatar'] ?? '',
      username: json['username'] ?? '',
      fullName: json['full_name'] ?? '',
      emailVerified: json['email_verified'] ?? false,
      contactNumberVerified: json['contact_number_verified'] ?? false,
    );
  }
}
