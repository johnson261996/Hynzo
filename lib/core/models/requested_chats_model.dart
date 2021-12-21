import 'dart:convert';

RequestedChatsModel requestedChatsModelFromJson(String str) =>
    RequestedChatsModel.fromJson(json.decode(str));

String requestedChatsModelToJson(RequestedChatsModel data) =>
    json.encode(data.toJson());

class RequestedChatsModel {
  RequestedChatsModel({
    required this.response,
  });

  List<Response> response;

  factory RequestedChatsModel.fromJson(Map<String, dynamic> json) =>
      RequestedChatsModel(
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
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
  String avatar;
  UserBasicInfo userBasicInfo;
  int unreadMessages;
  bool isGroup;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        lastMessage: LastMessage.fromJson(json["last_message"]),
        channelName: json["channel_name"],
        avatar: json["avatar"] ?? '',
        userBasicInfo: UserBasicInfo.fromJson(json["user_basic_info"]),
        unreadMessages: json["unread_messages"],
        isGroup: json["is_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_message": lastMessage.toJson(),
        "channel_name": channelName,
        "avatar": avatar,
        "user_basic_info": userBasicInfo.toJson(),
        "unread_messages": unreadMessages,
        "is_group": isGroup,
      };
}

class LastMessage {
  LastMessage();

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage();

  Map<String, dynamic> toJson() => {};
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
