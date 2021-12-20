import 'package:flutter/material.dart';
import 'package:hynzo/core/models/connected_list_model.dart';
import 'package:hynzo/themes/colors.dart';

class ConnectedWidget extends StatefulWidget {
  final Function getConnectedChats;
  const ConnectedWidget({Key? key, required this.getConnectedChats})
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
                    trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.blueDark,
                          minimumSize: const Size(90.0, 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: AppColors.blueDark),
                          ),
                        ),
                        child: Icon(
                          Icons.message,
                          color: AppColors.white,
                        )));
              },
              itemCount: connectedListModel.length,
            ),
    );
  }
}
