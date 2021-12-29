import 'dart:convert';

List<ConnectedListModel> connectedListModelFromJson(String str) =>
    List<ConnectedListModel>.from(
        json.decode(str).map((x) => ConnectedListModel.fromJson(x)));

class ConnectedListModel {
  ConnectedListModel({
    required this.id,
    required this.lastMessage,
    required this.channelName,
    required this.avatar,
    required this.userBasicInfo,
    required this.unreadMessages,
    required this.isGroup,
  });

  int id;
  LastMessage lastMessage;
  String channelName;
  dynamic avatar;
  UserBasicInfo userBasicInfo;
  int unreadMessages;
  bool isGroup;

  factory ConnectedListModel.fromJson(Map<String, dynamic> json) =>
      ConnectedListModel(
        id: json["id"],
        lastMessage: LastMessage.fromJson(json["last_message"]),
        channelName: json["channel_name"],
        avatar: json["avatar"] ?? '',
        userBasicInfo: UserBasicInfo.fromJson(json["user_basic_info"]),
        unreadMessages: json["unread_messages"],
        isGroup: json["is_group"],
      );
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
        id: int.parse(
            json["id"].toString() == '' ? '0' : json["id"].toString()),
        author: json["author"] == null
            ? Author(username: '', id: 0)
            : Author.fromJson(json["author"]),
        userId: int.parse(json["user_id"].toString() == ''
            ? '0'
            : json["user_id"].toString()),
        content: json["content"] ?? '',
        typeOfContent: json["type_of_content"] ?? 'text',
        timestamp: json["timestamp"] == ''
            ? DateTime.now()
            : DateTime.parse(json["timestamp"]),
      );
}

class Author {
  Author({
    required this.username,
    required this.id,
  });

  String username;
  int id;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        username: json["username"] ?? '',
        id: int.parse(
            json["id"].toString() == '' ? '0' : json["id"].toString()),
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
    required this.fullname,
    required this.contactBlockedStatus,
  });

  int id;
  bool isOnline;
  String fullname;
  ContactBlockedStatus contactBlockedStatus;

  factory UserBasicInfo.fromJson(Map<String, dynamic> json) => UserBasicInfo(
        id: json["id"],
        isOnline: json["is_online"],
        fullname: json["fullname"],
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
