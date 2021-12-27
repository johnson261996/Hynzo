import 'dart:convert';

UploadResponse uploadResponseFromJson(String str) =>
    UploadResponse.fromJson(json.decode(str));

String uploadResponseToJson(UploadResponse data) => json.encode(data.toJson());

class UploadResponse {
  UploadResponse({
    required this.id,
    required this.typeOfContent,
    required this.contentName,
    required this.content,
    required this.thumbnail,
    required this.extention,
    required this.duration,
  });

  int id;
  String typeOfContent;
  String contentName;
  String content;
  dynamic thumbnail;
  String extention;
  dynamic duration;

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
        id: json["id"],
        typeOfContent: json["type_of_content"],
        contentName: json["content_name"],
        content: json["content"],
        thumbnail: json["thumbnail"],
        extention: json["extention"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_of_content": typeOfContent,
        "content_name": contentName,
        "content": content,
        "thumbnail": thumbnail,
        "extention": extention,
        "duration": duration,
      };
}
