import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class CustomTheme {
  ChatTheme theme = const DefaultChatTheme(
    inputBackgroundColor: Colors.white,
    sendButtonIcon: Icon(
      Icons.send,
      color: Colors.indigo,
    ),
    attachmentButtonIcon: Icon(
      Icons.attach_file_rounded,
      color: Colors.indigo,
    ),
    inputTextColor: Colors.black,
    inputTextCursorColor: Colors.blueGrey,
    inputTextDecoration: InputDecoration.collapsed(
      hintText: 'enter message here',
    ),
  );
}