import 'package:flutter/cupertino.dart';
import 'package:hynzo/core/models/chat_list_model.dart';
import 'package:hynzo/core/models/connected_list_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/models/requested_chats_model.dart';
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

  Future<Map<String, dynamic>> setUserStatus(bool status) async {
    final response = await ChatService().setUserStatus(status: status);
    return response;
  }

  Future<RequestedChatsModel> getRequestedChatsList() async {
    final response = await ChatService().getRequestedList();
    return response;
  }

  Future<List<ConnectedListModel>> getConnectedChatList()async{
    final response = await ChatService().getConnectedChats();
    return response;
  }

}
