import 'package:flutter/material.dart';
import 'package:hynzo/core/models/requested_chats_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';

class RequestedWidget extends StatefulWidget {
  final Function getRequestedChats;

  const RequestedWidget({Key? key, required this.getRequestedChats})
      : super(key: key);

  @override
  State<RequestedWidget> createState() => _RequestedWidgetState();
}

class _RequestedWidgetState extends State<RequestedWidget> {
  late RequestedChatsModel suggestionModel;
  bool loading = true;

  @override
  void initState() {
    getRequestedList();
    super.initState();
  }

  getRequestedList() async {
    final RequestedChatsModel response = await widget.getRequestedChats();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        suggestionModel = response;
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
                    leading: suggestionModel.response[index].avatar != ''
                        ? CircleAvatar(
                            radius: 22.5,
                            backgroundImage: NetworkImage(
                                suggestionModel.response[index].avatar))
                        : Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.contain,
                            width: 45,
                            height: 45,
                          ),
                    title: Text(
                      suggestionModel.response[index].channelName,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blueDark,
                        minimumSize: const Size(70.0, 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: AppColors.blueDark),
                        ),
                      ),
                      child: Text(
                        Strings.ACCEPT,
                        style: Theme.of(context).textTheme.button!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ));
              },
              itemCount: suggestionModel.response.length,
            ),
    );
  }
}
