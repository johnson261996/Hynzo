import 'package:flutter/material.dart';
import 'package:hynzo/containers/chat/chat_message_container.dart';

class ChatMessageScreen extends StatelessWidget {
  final int channelId;
  final List<String> participants;

  const ChatMessageScreen({Key? key, required this.channelId,required this.participants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatMessageContainer(
        channelId: channelId,
        participants: participants,
      ),
    );
  }
}
