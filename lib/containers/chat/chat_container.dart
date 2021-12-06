import 'package:flutter/material.dart';
import 'package:hynzo/core/models/chat_list_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/providers/chat_provider.dart';
import 'package:hynzo/widgets/chat/chat_parent_widget.dart';
import 'package:provider/provider.dart';

class ChatContainer extends StatefulWidget {
  ChatContainer({Key? key}) : super(key: key);

  @override
  State<ChatContainer> createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  late ChatProvider _chatProvider;

  Future<ChatListModel> getAllChats(int limit, int offset){
    final response = _chatProvider.getChatList(limit, offset);
    return response;
  }

  Future<CreateChannelModel> createChannel(List<String> participants,bool isGroup){
    final response = _chatProvider.createChannel(participants, isGroup);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _chatProvider = Provider.of<ChatProvider>(context);
    return ChatWidget(getChatList: getAllChats,createChannel: createChannel,);
  }
}
