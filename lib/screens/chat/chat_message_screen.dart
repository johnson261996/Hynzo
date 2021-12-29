import 'package:flutter/material.dart';
import 'package:hynzo/containers/chat/chat_message_container.dart';
import 'package:hynzo/core/models/create_channel_model.dart';

class ChatMessageScreen extends StatelessWidget {
  final CreateChannelModel channelDetails;
  final bool status;
  final String userName;

  const ChatMessageScreen({
    Key? key,
    required this.channelDetails,
    required this.status,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatMessageContainer(
        channelDetails: channelDetails,
        status: status,
        userName: userName,
      ),
    );
  }
}
