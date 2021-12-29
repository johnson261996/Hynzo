import 'package:flutter/material.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/providers/chat_provider.dart';
import 'package:hynzo/providers/user_profile_provider.dart';
import 'package:hynzo/widgets/profile/profile_widget.dart';
import 'package:provider/provider.dart';

class ProfileContainer extends StatefulWidget {
  Map args;

  ProfileContainer({Key? key, required this.args}) : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  static UserProfileProvider? _userProvider;
  late ChatProvider _chatProvider;
  UserProfileModel userDetails = UserProfileModel();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future<UserProfileModel> getUserData() async {
    UserProfileModel userResponse =
        await _userProvider!.getUser(widget.args['id']);
    return userResponse;
  }

  Future<CreateChannelModel> createChannel(
      List<String> participants, bool isGroup) {
    final response = _chatProvider.createChannel(participants, isGroup);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProfileProvider>(context, listen: false);
    _chatProvider = Provider.of<ChatProvider>(context);
    return ProfileWidget(
      getUserDetails: getUserData,
      args: widget.args,
      addUser: createChannel,
    );
  }
}
