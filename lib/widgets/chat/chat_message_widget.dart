import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:hynzo/core/models/chat_socket_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/models/new_message_model.dart';
import 'package:hynzo/core/models/upload_content_model.dart';
import 'package:hynzo/core/services/home/home_service.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/themes/themes.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:hynzo/utils/message_encrypt.dart';
import 'package:hynzo/widgets/chat/chat_bottom_widget.dart';
import 'package:hynzo/widgets/chat/chat_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatMessageWidget extends StatefulWidget {
  final CreateChannelModel channelDetails;
  final bool status;
  final String userName;
  final Function setUserStatus;

  const ChatMessageWidget(
      {Key? key,
      required this.channelDetails,
      required this.status,
      required this.userName,
      required this.setUserStatus})
      : super(key: key);

  @override
  _ChatMessageWidgetState createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  List<types.Message> _messages = [];
  bool isInitLoaded = false;
  bool loading = true;
  bool uploading = false;
  bool stickerOpen = false;
  late WebSocketChannel channel;
  int? uid;
  String? token;
  String? name;
  late types.User _user;
  late MessageEncrypt _encrypt;

  @override
  void initState() {
    super.initState();
    _encrypt = MessageEncrypt.initialize(widget.channelDetails.encryptionKey);
    _loadMessages();
  }

  Future<bool> assignUser() async {
    uid = await LocalStorage.getUserID();
    token = await LocalStorage.getLoginToken();
    _user = types.User(
      id: uid.toString(),
      firstName: widget.userName,
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

  Future<UploadResponse> uploadPhoto(XFile pickedFile) async {
    setState(() {
      uploading = true;
    });
    UploadResponse response = await HomeService().uploadPicService(pickedFile);
    setState(() {
      uploading = false;
    });
    return response;
  }

  Future<UploadResponse> uploadSticker(String filePath) async {
    setState(() {
      uploading = true;
    });
    UploadResponse response =
        await HomeService().uploadStickerService(filePath);
    setState(() {
      uploading = false;
    });
    return response;
  }

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isDismissible: true,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: 150,
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 65),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  blurRadius: 3,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  icon: const Icon(
                    Icons.photo_library_rounded,
                    size: 25,
                  ),
                  label: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  icon: const Icon(
                    Icons.folder_open,
                    size: 25,
                  ),
                  label: const Align(
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
      UploadResponse uploadJob = await uploadPhoto(result);
      _sendImageToChannel(uploadJob.content, uploadJob.id, 'image');
    }
  }

  void _handleMessageTap(types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void _handleMessageRead() {
    channel.sink.add(
        '{"command": "read_message", "username": "", "user_id": $uid, "chatId": ${widget.channelDetails.id}}');
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

  void _handleOnStickerSend(String sticker) async {
    UploadResponse uploadJob = await uploadSticker(sticker);
    _sendImageToChannel(uploadJob.content, uploadJob.id, 'sticker');
  }

  void _sendImageToChannel(String imgUrl, int mId, String type) {
    String encText = '';
    encText = _encrypt.encrypt(imgUrl);
    channel.sink.add(
        '{"command": "new_message",  "from": $uid, "message": "$encText", "chatId": ${widget.channelDetails.id}, "type_of_content": "$type", "media_id": "$mId", "offline_locator":""}');
    setState(() {
      stickerOpen = false;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    String encText = '';
    encText = _encrypt.encrypt(message.text);
    channel.sink.add(
        '{"command": "new_message",  "from": $uid, "message": "$encText", "chatId": ${widget.channelDetails.id}, "type_of_content": "text", "media_id": "", "offline_locator":""}');
  }

  void _loadMessages() async {
    await assignUser();
    channel = WebSocketChannel.connect(Uri.parse(
        'ws://35.154.69.40:9000/api/v1/ws/chat/${widget.channelDetails.id}?token=$token'));
    log(Uri.parse(
            'ws://35.154.69.40:9000/api/v1/ws/chat/${widget.channelDetails.id}?token=$token')
        .toString());
    Future.delayed(const Duration(microseconds: 500)).whenComplete(() =>
        channel.sink.add(
            '{"command": "fetch_messages", "username": "${widget.channelDetails.participants[1]}", "user_id": $uid, "chatId": ${widget.channelDetails.id}}'));
    setState(() {
      loading = false;
    });
    _handleMessageRead();
    setUserStatus(true);
  }

  setUserStatus(bool status) {
    widget.setUserStatus(status);
  }

  @override
  void dispose() {
    setUserStatus(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              if (_user.firstName != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _user.firstName!,
                      style: Themes.baseTheme.textTheme.bodyText1!
                          .copyWith(color: AppColors.blackBlue, fontSize: 16),
                    ),
                    Text(
                      widget.status ? 'online' : 'offline',
                      style: Themes.baseTheme.textTheme.bodyText1!.copyWith(
                        color: AppColors.offgreylight,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        backgroundColor: AppColors.white,
        leadingWidth: 30,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.blackBlue,
            )),
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
                          switch (element.typeOfContent) {
                            case 'text':
                              _messages.insert(
                                  _messages.length,
                                  types.Message.fromJson({
                                    "author": {
                                      "firstName": element.author.username,
                                      "id": element.author.id.toString(),
                                      "imageUrl": element.author.avatar
                                    },
                                    "createdAt": element
                                        .timestamp.millisecondsSinceEpoch,
                                    "id": element.id.toString(),
                                    "status": element.seenBy.isEmpty
                                        ? "delivered"
                                        : "seen",
                                    "text": _encrypt.decrypt(element.content),
                                    "type": element.typeOfContent
                                  }));
                              break;
                            case 'image':
                              _messages.insert(
                                  _messages.length,
                                  types.Message.fromJson({
                                    "author": {
                                      "firstName": element.author.username,
                                      "id": element.author.id.toString(),
                                      "imageUrl": element.author.avatar
                                    },
                                    "createdAt": element
                                        .timestamp.millisecondsSinceEpoch,
                                    "id": element.id.toString(),
                                    "status": element.seenBy.isEmpty
                                        ? "delivered"
                                        : "seen",
                                    "text": _encrypt.decrypt(element.content),
                                    "type": element.typeOfContent,
                                    "name": 'Image',
                                    "size":
                                        MediaQuery.of(context).size.width / 2,
                                    "uri": _encrypt.decrypt(element.content)
                                  }));
                              break;
                            case 'sticker':
                              _messages.insert(
                                  _messages.length,
                                  types.CustomMessage.fromJson({
                                    "author": {
                                      "firstName": element.author.username,
                                      "id": element.author.id.toString(),
                                      "imageUrl": element.author.avatar
                                    },
                                    "createdAt": element
                                        .timestamp.millisecondsSinceEpoch,
                                    "id": element.id.toString(),
                                    "status": element.seenBy.isEmpty
                                        ? "delivered"
                                        : "seen",
                                    "text": _encrypt.decrypt(element.content),
                                    "type": 'custom',
                                    "name": 'Sticker',
                                    "size":
                                        MediaQuery.of(context).size.width / 3,
                                    "metadata": {
                                      'uri': _encrypt.decrypt(element.content)
                                    }
                                  }));
                              break;
                          }
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
                    switch (msg.message.typeOfContent) {
                      case 'text':
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
                              "status": "delivered",
                              "text": _encrypt.decrypt(msg.message.content),
                              "type": msg.message.typeOfContent
                            }));
                        break;
                      case 'image':
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
                              "status": "delivered",
                              "text": _encrypt.decrypt(msg.message.content),
                              "type": msg.message.typeOfContent,
                              "name": 'Image',
                              "size": MediaQuery.of(context).size.width / 2,
                              "uri": _encrypt.decrypt(msg.message.content)
                            }));
                        break;
                      case 'sticker':
                        _messages.insert(
                            0,
                            types.CustomMessage.fromJson({
                              "author": {
                                "firstName": msg.message.author.username,
                                "id": msg.message.author.id.toString(),
                                "imageUrl": msg.message.author.avatar
                              },
                              "createdAt":
                                  msg.message.timestamp.millisecondsSinceEpoch,
                              "id": msg.message.id.toString(),
                              "status": "delivered",
                              "text": _encrypt.decrypt(msg.message.content),
                              "type": 'custom',
                              "name": 'Sticker',
                              "size": MediaQuery.of(context).size.width / 3,
                              "metadata": {
                                'uri': _encrypt.decrypt(msg.message.content)
                              }
                            }));
                        break;
                    }
                  }
                }

                return Chat(
                  showUserNames: false,
                  sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                  showUserAvatars: false,
                  customBottomWidget: ChatBottomWidget(
                    onAttachPressed: _handleAtachmentPressed,
                    onSendPressed: _handleSendPressed,
                    onStickerSend: _handleOnStickerSend,
                    onEmojiPressed: () {
                      setState(() {
                        stickerOpen = !stickerOpen;
                      });
                    },
                    isLoading: uploading,
                    stickerOpen: stickerOpen,
                  ),
                  imageMessageBuilder: (p0, {required messageWidth}) =>
                      Image.network(
                    p0.uri,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(20),
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          color: Colors.grey,
                          valueColor:
                              const AlwaysStoppedAnimation(Colors.indigo),
                        ),
                      );
                    },
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fitWidth,
                  ),
                  customMessageBuilder: (p0, {required messageWidth}) {
                    return Image.network(
                      p0.metadata!['uri'],
                      width: MediaQuery.of(context).size.width / 3,
                      fit: BoxFit.fitWidth,
                    );
                  },
                  bubbleBuilder: (child,
                      {required message, required nextMessageInGroup}) {
                    switch (message.type) {
                      case types.MessageType.custom:
                        return Container(
                          child: child,
                        );
                      case types.MessageType.file:
                        return Container(
                          child: child,
                        );
                      case types.MessageType.image:
                        return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: child,
                        );
                      case types.MessageType.text:
                        return Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: message.author.id == uid.toString()
                                  ? Colors.indigo
                                  : Colors.grey[200]),
                          child: child,
                        );
                      case types.MessageType.unsupported:
                        return Container(
                          child: child,
                        );
                    }
                  },
                  hideBackgroundOnEmojiMessages: true,
                  emojiEnlargementBehavior: EmojiEnlargementBehavior.multi,
                  scrollPhysics: const BouncingScrollPhysics(),
                  theme: CustomTheme().theme,
                  messages: _messages,
                  onAttachmentPressed: _handleAtachmentPressed,
                  onMessageTap: _handleMessageTap,
                  onPreviewDataFetched: _handlePreviewDataFetched,
                  onSendPressed: (value) {},
                  user: _user,
                );
              }),
    );
  }
}
