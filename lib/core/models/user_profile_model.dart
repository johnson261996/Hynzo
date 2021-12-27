///user profile model created for application

class UserProfileModel {
  final String? username;
  final int? id;
  final String? email;
  final String? full_name;
  final String? dob;
  final String? gender;
  final String? gender_detail;
  final String? contact_number;
  final bool? email_verified;
  final bool? contact_number_verified;
  final String? dummy_avatar;
  final String? avatar;
  final String? profile_visibility;
  final bool? ghost_mode;
  final bool? night_mode;
  final bool? online_mode;
  final bool? mute_mode;
  final int? statusCode;

  const UserProfileModel(
      {this.username,
      this.id,
      this.email,
      this.full_name,
      this.dob,
      this.gender,
      this.gender_detail,
      this.contact_number,
      this.email_verified,
      this.contact_number_verified,
      this.dummy_avatar,
      this.avatar,
      this.profile_visibility,
      this.ghost_mode,
      this.night_mode,
      this.online_mode,
      this.mute_mode,
      this.statusCode});

  factory UserProfileModel.fromJson(Map<String, dynamic> json, int code) {
    return UserProfileModel(
      username: json['username'],
      id: json['id'],
      email: json['email'] ?? '',
      full_name: json['full_name'],
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      gender_detail: json['gender_detail'] ?? '',
      contact_number: json['contact_number'],
      email_verified: json['email_verified'],
      contact_number_verified: json['contact_number_verified'],
      dummy_avatar: json['dummy_avatar'] ?? '',
      avatar: json['avatar'] ?? '',
      profile_visibility: json['profile_visibility'],
      ghost_mode: json['ghost_mode'],
      night_mode: json['night_mode'],
      online_mode: json['online_mode'],
      mute_mode: json['mute_mode'],
      statusCode: code,
    );
  }
}
