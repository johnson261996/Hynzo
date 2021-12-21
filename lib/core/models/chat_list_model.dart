import 'dart:convert';

List<ChatListModel> chatListModelFromJson(String str) =>
    List<ChatListModel>.from(
        json.decode(str).map((x) => ChatListModel.fromJson(x)));

String chatListModelToJson(List<ChatListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatListModel {
  ChatListModel({
    required this.id,
    required this.lastMessage,
    required this.channelName,
    required this.avatar,
    required this.userBasicInfo,
    required this.unreadMessages,
    required this.isGroup,
    required this.encryptionKey,
  });

  int id;
  LastMessage lastMessage;
  String channelName;
  String avatar;
  UserBasicInfo userBasicInfo;
  int unreadMessages;
  bool isGroup;
  String encryptionKey;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        id: json["id"],
        lastMessage: LastMessage.fromJson(json["last_message"]),
        channelName: json["channel_name"],
        avatar: json["avatar"] ?? '',
        userBasicInfo: UserBasicInfo.fromJson(json["user_basic_info"]),
        unreadMessages: json["unread_messages"],
        isGroup: json["is_group"],
        encryptionKey: json["encryption_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_message": lastMessage.toJson(),
        "channel_name": channelName,
        "avatar": avatar,
        "user_basic_info": userBasicInfo.toJson(),
        "unread_messages": unreadMessages,
        "is_group": isGroup,
        "encryption_key": encryptionKey,
      };
}

class LastMessage {
  LastMessage({
    required this.id,
    required this.author,
    required this.userId,
    required this.content,
    required this.typeOfContent,
    required this.timestamp,
  });

  int id;
  Author author;
  int userId;
  String content;
  String typeOfContent;
  DateTime timestamp;

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["id"],
        author: Author.fromJson(json["author"]),
        userId: json["user_id"],
        content: json["content"],
        typeOfContent: json["type_of_content"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author.toJson(),
        "user_id": userId,
        "content": content,
        "type_of_content": typeOfContent,
        "timestamp": timestamp.toIso8601String(),
      };
}

class Author {
  Author({
    required this.username,
    required this.id,
  });

  String username;
  int id;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        username: json["username"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
      };
}

class UserBasicInfo {
  UserBasicInfo({
    required this.id,
    required this.isOnline,
    required this.contactBlockedStatus,
  });

  int id;
  bool isOnline;
  ContactBlockedStatus contactBlockedStatus;

  factory UserBasicInfo.fromJson(Map<String, dynamic> json) => UserBasicInfo(
        id: json["id"],
        isOnline: json["is_online"],
        contactBlockedStatus:
            ContactBlockedStatus.fromJson(json["contact_blocked_status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_online": isOnline,
        "contact_blocked_status": contactBlockedStatus.toJson(),
      };
}

class ContactBlockedStatus {
  ContactBlockedStatus({
    required this.chatBlocked,
    required this.isBlockedByYou,
  });

  bool chatBlocked;
  bool isBlockedByYou;

  factory ContactBlockedStatus.fromJson(Map<String, dynamic> json) =>
      ContactBlockedStatus(
        chatBlocked: json["chat_blocked"],
        isBlockedByYou: json["is_blocked_by_you"],
      );

  Map<String, dynamic> toJson() => {
        "chat_blocked": chatBlocked,
        "is_blocked_by_you": isBlockedByYou,
      };
}
