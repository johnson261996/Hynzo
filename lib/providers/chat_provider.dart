import 'package:flutter/cupertino.dart';
import 'package:hynzo/core/models/chat_list_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/services/chat/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  Future<ChatListModel> getChatList(int? limit, int? offset) async {
    final ChatListModel response =
        await ChatService().getAllChats(limit: limit, offset: offset);
    notifyListeners();
    return response;
  }

  Future<CreateChannelModel> createChannel(
      List<String> participants, bool isGroup) async {
    final CreateChannelModel response = await ChatService()
        .createChannel(participants: participants, isGroup: isGroup);
    notifyListeners();
    return response;
  }
}
