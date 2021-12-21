import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hynzo/core/models/connected_list_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/screens/chat/chat_message_screen.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';

class ConnectedWidget extends StatefulWidget {
  final Function getConnectedChats;
  final Function(List<String>, bool)? createChannel;
  const ConnectedWidget(
      {Key? key, required this.getConnectedChats, required this.createChannel})
      : super(key: key);

  @override
  State<ConnectedWidget> createState() => _ConnectedWidgetState();
}

class _ConnectedWidgetState extends State<ConnectedWidget> {
  late List<ConnectedListModel> connectedListModel;
  bool loading = true;

  @override
  void initState() {
    getRequestedList();
    super.initState();
  }

  getRequestedList() async {
    final List<ConnectedListModel> response = await widget.getConnectedChats();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        connectedListModel = response;
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
      child: loading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.blueDark,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(
                right: 5.0,
                left: 5.0,
                bottom: 80.0,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    dense: false,
                    visualDensity: VisualDensity.standard,
                    leading: connectedListModel[index].avatar != ''
                        ? CircleAvatar(
                            radius: 22.5,
                            backgroundImage:
                                NetworkImage(connectedListModel[index].avatar))
                        : Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.contain,
                            width: 45,
                            height: 45,
                          ),
                    title: Text(
                      connectedListModel[index].channelName,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          int? uid = await LocalStorage.getUserID();
                          EasyLoading.show(maskType: EasyLoadingMaskType.black);
                          CreateChannelModel response =
                              await widget.createChannel!([
                            '$uid',
                            '${connectedListModel[index].userBasicInfo.id}'
                          ], false);
                          EasyLoading.dismiss(animation: false);
                          if (response.participants.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatMessageScreen(
                                  channelDetails: response,
                                  status: connectedListModel[index]
                                      .userBasicInfo
                                      .isOnline,
                                  userName:
                                      connectedListModel[index].channelName,
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.message_rounded,
                          color: AppColors.blueDark,
                          size: 25,
                        )));
              },
              itemCount: connectedListModel.length,
            ),
    );
  }
}
