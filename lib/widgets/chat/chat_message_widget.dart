import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:file_picker/file_picker.dart';
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
  bool loading = true;
  late WebSocketChannel channel;
  final _user = const types.User(
    id: '186',
    firstName: 'Lin',
    lastName: 'Sanjo',
    imageUrl:
        'https://i.picsum.photos/id/1075/200/300.jpg?hmac=pffU5_mFDClpUhsTVng81yHXXvdsGGKHi1jCz2pRsaU',
    role: types.Role.user,
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
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
    final textMessage = types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
        status: types.Status.delivered);

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    String? token = await LocalStorage.getLoginToken();
    channel = WebSocketChannel.connect(Uri.parse(
        'ws://api.inventchat.com/api/v1/ws/chat/${widget.channelId}?token=$token'));
    Future.delayed(const Duration(microseconds: 500)).whenComplete(() =>
        channel.sink.add(
            '{"command": "fetch_messages", "username": "${widget.participants[0]}", "user_id": 186, "chatId": ${widget.channelId}}'));
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
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Text('${snapshot.data}' '\n' +
                    snapshot.error.toString() +
                    '\n' +
                    snapshot.connectionState.toString());

                _messages.insert(
                    _messages.length,
                    types.Message.fromJson(const {
                      "author": {
                        "firstName": "John",
                        "id": "b4878b96-efbc-479a-8291-474ef323dec7",
                        "imageUrl":
                            "https://avatars.githubusercontent.com/u/14123304?v=4"
                      },
                      "createdAt": 1598438788000,
                      "id": "b23e5907-6d8b-4134-8cf3-c6dd34fc42d2",
                      "status": "seen",
                      "text": "Hic iure corrupti aut delectus tempore.",
                      "type": "text"
                    }));
                return Chat(
                  showUserNames: true,
                  showUserAvatars: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                  theme: const DefaultChatTheme(),
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
