///model created for uploading avatar image
///
import 'dart:convert';

UploadAvatarResponse uploadResponseFromJson(String str) =>
    UploadAvatarResponse.fromJson(json.decode(str));

String uploadResponseToJson(UploadAvatarResponse data) =>
    json.encode(data.toJson());

class UploadAvatarResponse {
  String avatar;

  UploadAvatarResponse({
    required this.avatar,
  });

  factory UploadAvatarResponse.fromJson(Map<String, dynamic> json) =>
      UploadAvatarResponse(
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": avatar,
      };
}
