// To parse this JSON data, do
//
//     final newMessageModel = newMessageModelFromJson(jsonString);

import 'dart:convert';

NewMessageModel newMessageModelFromJson(String str) => NewMessageModel.fromJson(json.decode(str));

String newMessageModelToJson(NewMessageModel data) => json.encode(data.toJson());

class NewMessageModel {
  NewMessageModel({
    required this.command,
    required this.message,
  });

  String command;
  Message message;

  factory NewMessageModel.fromJson(Map<String, dynamic> json) => NewMessageModel(
    command: json["command"],
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "command": command,
    "message": message.toJson(),
  };
}

class Message {
  Message({
    required this.id,
    required this.author,
    required this.userId,
    required this.content,
    required this.typeOfContent,
    required this.offlineLocator,
    required this.media,
    required this.timestamp,
  });

  int id;
  Author author;
  int userId;
  String content;
  String typeOfContent;
  String offlineLocator;
  Media media;
  DateTime timestamp;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    author: Author.fromJson(json["author"]),
    userId: json["user_id"],
    content: json["content"],
    typeOfContent: json["type_of_content"],
    offlineLocator: json["offline_locator"],
    media: Media.fromJson(json["media"]),
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author.toJson(),
    "user_id": userId,
    "content": content,
    "type_of_content": typeOfContent,
    "offline_locator": offlineLocator,
    "media": media.toJson(),
    "timestamp": timestamp.toIso8601String(),
  };
}

class Author {
  Author({
    required this.username,
    required this.authorId,
    required this.avatar,
    required this.id,
  });

  String username;
  int authorId;
  dynamic avatar;
  int id;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    username: json["username"],
    authorId: json["author_id"],
    avatar: json["avatar"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "author_id": authorId,
    "avatar": avatar,
    "id": id,
  };
}

class Media {
  Media();

  factory Media.fromJson(Map<String, dynamic> json) => Media(
  );

  Map<String, dynamic> toJson() => {
  };
}
