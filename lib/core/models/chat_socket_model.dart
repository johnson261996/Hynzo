import 'dart:convert';

ChatSocketModel chatSocketModelFromJson(String str) =>
    ChatSocketModel.fromJson(json.decode(str));

String chatSocketModelToJson(ChatSocketModel data) =>
    json.encode(data.toJson());

class ChatSocketModel {
  ChatSocketModel({
    required this.command,
    required this.messages,
  });

  String command;
  List<Message> messages;

  factory ChatSocketModel.fromJson(Map<String, dynamic> json) =>
      ChatSocketModel(
        command: json["command"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "command": command,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.id,
    required this.author,
    required this.userId,
    required this.content,
    required this.typeOfContent,
    required this.media,
    required this.timestamp,
    required this.seenBy,
  });

  int id;
  Author author;
  int userId;
  String content;
  String typeOfContent;
  Media media;
  DateTime timestamp;
  List<Map<String, dynamic>> seenBy;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      id: json["id"],
      author: Author.fromJson(json["author"]),
      userId: json["user_id"],
      content: json["content"],
      typeOfContent: json["type_of_content"],
      media: Media.fromJson(json["media"]),
      timestamp: DateTime.parse(json["timestamp"]),
      seenBy: List.from(json["seen_by"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author.toJson(),
        "user_id": userId,
        "content": content,
        "type_of_content": typeOfContent,
        "media": media.toJson(),
        "timestamp": timestamp.toIso8601String(),
      };
}

class Author {
  Author({
    required this.username,
    required this.avatar,
    required this.id,
  });

  String username;
  String avatar;
  int id;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        username: json["username"],
        avatar: json["avatar"] ?? '',
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "avatar": avatar,
        "id": id,
      };
}

class Media {
  Media();

  factory Media.fromJson(Map<String, dynamic> json) => Media();

  Map<String, dynamic> toJson() => {};
}
