import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:hynzo/core/models/chat_socket_model.dart';
import 'package:hynzo/core/models/new_message_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/themes/themes.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatMessageWidget extends StatefulWidget {
  final int channelId;
  final List<String> participants;

  const ChatMessageWidget(
      {Key? key, required this.channelId, required this.participants})
      : super(key: key);

  @override
  _ChatMessageWidgetState createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  List<types.Message> _messages = [];
  bool isInitLoaded = false;
  bool loading = true;
  late WebSocketChannel channel;
  int? uid;
  String? token;
  late types.User _user;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<bool> assignUser() async {
    uid = await LocalStorage.getUserID();
    token = await LocalStorage.getLoginToken();
    _user = types.User(
      id: uid.toString(),
      firstName: '',
      lastName: '',
      imageUrl:
          'https://i.picsum.photos/id/1075/200/300.jpg?hmac=pffU5_mFDClpUhsTVng81yHXXvdsGGKHi1jCz2pRsaU',
      role: types.Role.user,
    );
    return true;
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      maxHeight: 2560,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    channel.sink.add(
        '{"command": "new_message",  "from": $uid, "message": "${message.text}", "chatId": ${widget.channelId}, "type_of_content": "text", "media_id": "", "offline_locator":""}');
  }

  void _loadMessages() async {
    await assignUser();
    channel = WebSocketChannel.connect(Uri.parse(
        'ws://35.154.69.40:9000/api/v1/ws/chat/${widget.channelId}?token=$token'));
    log(Uri.parse(
            'ws://35.154.69.40:9000/api/v1/ws/chat/${widget.channelId}?token=$token')
        .toString());
    Future.delayed(const Duration(microseconds: 500)).whenComplete(() =>
        channel.sink.add(
            '{"command": "fetch_messages", "username": "${widget.participants[1]}", "user_id": $uid, "chatId": ${widget.channelId}}'));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _user.firstName!,
          style: Themes.baseTheme.textTheme.bodyText1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.blackBlue,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder<dynamic>(
              stream: channel.stream,
              builder: (context, snapshot) {
                log(snapshot.connectionState.toString());
                log(snapshot.data.toString());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  if (jsonDecode(snapshot.data)['command'] == 'messages') {
                    if (!isInitLoaded) {
                      ChatSocketModel chats =
                          ChatSocketModel.fromJson(jsonDecode(snapshot.data));
                      if (chats.messages.isNotEmpty) {
                        chats.messages.forEach((element) {
                          _messages.insert(
                              _messages.length,
                              types.Message.fromJson({
                                "author": {
                                  "firstName": element.author.username,
                                  "id": element.author.id.toString(),
                                  "imageUrl": element.author.avatar,
                                },
                                "createdAt":
                                    element.timestamp.millisecondsSinceEpoch,
                                "id": element.id.toString(),
                                "status": "seen",
                                "text": element.content,
                                "type": "text",
                              }));
                        });
                        WidgetsBinding.instance!
                            .addPostFrameCallback((timeStamp) {
                          setState(() {
                            isInitLoaded = true;
                          });
                        });
                      }
                    }
                  } else if (jsonDecode(snapshot.data)['command'] ==
                      'new_message') {
                    NewMessageModel msg =
                        NewMessageModel.fromJson(jsonDecode(snapshot.data));
                    _messages.insert(
                        0,
                        types.Message.fromJson({
                          "author": {
                            "firstName": msg.message.author.username,
                            "id": msg.message.author.id.toString(),
                            "imageUrl": msg.message.author.avatar
                          },
                          "createdAt":
                              msg.message.timestamp.millisecondsSinceEpoch,
                          "id": msg.message.id.toString(),
                          "status": "seen",
                          "text": msg.message.content,
                          "type": "text"
                        }));
                  }
                }

                return Chat(
                  showUserNames: false,
                  sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                  showUserAvatars: false,
                  scrollPhysics: const BouncingScrollPhysics(),
                  theme: DefaultChatTheme(
                      inputBackgroundColor: Colors.white,
                      sendButtonIcon: Icon(
                        Icons.send,
                        color: Colors.indigo,
                      ),
                      attachmentButtonIcon: Icon(
                        Icons.pin,
                        color: Colors.indigo,
                      )),
                  messages: _messages,
                  onAttachmentPressed: _handleAtachmentPressed,
                  onMessageTap: _handleMessageTap,
                  onPreviewDataFetched: _handlePreviewDataFetched,
                  onSendPressed: _handleSendPressed,
                  user: _user,
                );
              }),
    );
  }
}
