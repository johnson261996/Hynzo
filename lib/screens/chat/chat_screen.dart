///Chat screen for user
///Shows all the connected users, received requests and suggested users.

import 'package:flutter/material.dart';
import 'package:invent_chat/containers/chat/chat_container.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatContainer(),
    );
  }
}
