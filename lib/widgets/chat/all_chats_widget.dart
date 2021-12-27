import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hynzo/core/models/chat_list_model.dart';
import 'package:hynzo/core/models/chat_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/screens/chat/chat_message_screen.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/themes/themes.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/message_encrypt.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class AllChatsWidget extends StatefulWidget {
  const AllChatsWidget(
      {Key? key, required this.getChatList, required this.createChannel})
      : super(key: key);

  final Function(int, int)? getChatList;
  final Function(List<String>, bool)? createChannel;

  @override
  State<AllChatsWidget> createState() => _AllChatsWidgetState();
}

class _AllChatsWidgetState extends State<AllChatsWidget> {
  List<ChatModel> allChats = [];
  bool loading = true;
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  late MessageEncrypt _encrypt;

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('en_short', timeago.EnShortMessages());
    getAllChats(10, 0);
  }

  getAllChats(int limit, int offset) async {
    final List<ChatListModel> response =
        await widget.getChatList!(limit, offset);
    allChats.clear();
    response.forEach((element) {
      _encrypt = MessageEncrypt.initialize(element.encryptionKey);
      allChats.add(
        ChatModel(
          senderId: element.userBasicInfo.id,
          imagePath: element.avatar,
          name: element.channelName,
          unreadCount: element.unreadMessages,
          status: element.userBasicInfo.isOnline ? 'active' : 'inacvtive',
          isRead: false,
          content: element.lastMessage.typeOfContent == 'image'
              ? 'Image'
              : element.lastMessage.typeOfContent == 'sticker'
                  ? 'Sticker'
                  : _encrypt.decrypt(element.lastMessage.content),
          dateTime: element.lastMessage.timestamp,
        ),
      );
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        allChats = allChats;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: allChats.isEmpty || loading
          ? Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: AppColors.blueDark,
                    )
                  : const Text('No chats available'),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: allChats.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    int? uid = await LocalStorage.getUserID();
                    EasyLoading.show(maskType: EasyLoadingMaskType.black);
                    CreateChannelModel response = await widget.createChannel!(
                        ['$uid', '${allChats[index].senderId}'], false);
                    EasyLoading.dismiss(animation: false);
                    if (response.participants.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatMessageScreen(
                            channelDetails: response,
                            status: allChats[index].status == 'active',
                            userName: allChats[index].name!,
                          ),
                        ),
                      ).then((value) => getAllChats(10, 0));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: 80,
                    margin: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: allChats[index].unreadCount! > 0
                          ? AppColors.lighterblue.withOpacity(0.3)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: allChats[index].imagePath! == ''
                                ? Container(
                                    width: 50,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        allChats[index]
                                            .name!
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: Themes
                                            .baseTheme.textTheme.headline2!
                                            .copyWith(
                                                color: AppColors.blueDark,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  )
                                : Image.network(
                                    allChats[index].imagePath!,
                                    fit: BoxFit.contain,
                                    width: 50.0,
                                    height: 50.0,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          allChats[index]
                                              .name!
                                              .substring(0, 1)
                                              .toUpperCase(),
                                          style: Themes
                                              .baseTheme.textTheme.headline2!
                                              .copyWith(
                                                  color: AppColors.blueDark,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                    ),
                                  ),
                          ),
                          if (allChats[index].status == "active") ...[
                            Positioned(
                              top: 35.0,
                              left: 40.0,
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: AppColors.green,
                                ),
                              ),
                            )
                          ] else if (allChats[index].status == "inactive") ...[
                            Positioned(
                              top: 35.0,
                              left: 40.0,
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: AppColors.offline,
                                ),
                              ),
                            )
                          ] else if (allChats[index].status == "unread") ...[
                            Positioned(
                              top: 35.0,
                              left: 40.0,
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: AppColors.geryYellow,
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                      title: Text(
                        allChats[index].name!,
                        style: Theme.of(context).textTheme.headline6!.apply(
                              color: AppColors.greyBlack,
                            ),
                      ),
                      subtitle: allChats[index].isRead!
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/read.png',
                                  width: 10.0,
                                  height: 10.0,
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  allChats[index].content!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: AppColors.offblue,
                                      ),
                                ),
                              ],
                            )
                          : Text(
                              allChats[index].content!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: AppColors.offblue,
                                  ),
                            ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            DateTime.now()
                                        .difference(allChats[index].dateTime!) >
                                    const Duration(hours: 24)
                                ? formatter.format(allChats[index].dateTime!)
                                : timeago.format(allChats[index].dateTime!),
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: AppColors.greishBlack,
                                    ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          if (allChats[index].unreadCount! > 0)
                            Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: AppColors.blueDark,
                              ),
                              child: Center(
                                child: Text(
                                  allChats[index].unreadCount!.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
