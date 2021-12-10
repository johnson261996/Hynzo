import 'package:flutter/material.dart';
import 'package:hynzo/widgets/chat/chat_message_widget.dart';

class ChatMessageContainer extends StatelessWidget {
  final int channelId;
  final List<String> participants;
  const ChatMessageContainer({Key? key,required this.channelId,required this.participants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatMessageWidget(channelId: channelId,participants: participants,);
  }
}
