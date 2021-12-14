import 'package:flutter/material.dart';
import 'package:hynzo/providers/chat_provider.dart';
import 'package:hynzo/widgets/chat/chat_message_widget.dart';
import 'package:provider/provider.dart';

class ChatMessageContainer extends StatefulWidget {
  final int channelId;
  final List<String> participants;
  final bool status;
  final String userName;

  const ChatMessageContainer({
    Key? key,
    required this.channelId,
    required this.participants,
    required this.status,
    required this.userName,
  }) : super(key: key);

  @override
  State<ChatMessageContainer> createState() => _ChatMessageContainerState();
}

class _ChatMessageContainerState extends State<ChatMessageContainer> {
  late ChatProvider _chatProvider;

  Future<Map<String, dynamic>> setUserStatus(bool status) async {
    final response = await _chatProvider.setUserStatus(status);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _chatProvider = Provider.of<ChatProvider>(context);
    return ChatMessageWidget(
      channelId: widget.channelId,
      participants: widget.participants,
      status: widget.status,
      setUserStatus: setUserStatus,
      userName: widget.userName,
    );
  }
}
