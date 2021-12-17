import 'dart:convert';

CreateChannelModel createChannelModelFromJson(String str) => CreateChannelModel.fromJson(json.decode(str));

String createChannelModelToJson(CreateChannelModel data) => json.encode(data.toJson());

class CreateChannelModel {
  CreateChannelModel({
    required this.id,
    required this.messages,
    required this.participants,
    required this.isGroup,
    required this.encryptionKey,
  });

  int id;
  String messages;
  List<String> participants;
  bool isGroup;
  String encryptionKey;

  factory CreateChannelModel.fromJson(Map<String, dynamic> json) => CreateChannelModel(
    id: json["id"],
    messages: json["messages"],
    participants: List<String>.from(json["participants"].map((x) => x)),
    isGroup: json["is_group"],
    encryptionKey: json['encryption_key'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "messages": messages,
    "participants": List<dynamic>.from(participants.map((x) => x)),
    "is_group": isGroup,
    "encryption_key" : encryptionKey,
  };
}
