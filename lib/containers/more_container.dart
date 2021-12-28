import 'package:flutter/material.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/providers/user_profile_provider.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/widgets/more/more_widget.dart';
import 'package:provider/provider.dart';

class MoreContainer extends StatefulWidget {
  const MoreContainer({Key? key}) : super(key: key);

  @override
  State<MoreContainer> createState() => _MoreContainerState();
}

class _MoreContainerState extends State<MoreContainer> {
  static UserProfileProvider? _userProvider;
  UserProfileModel userDatas = UserProfileModel();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userProvider = Provider.of<UserProfileProvider>(context, listen: false);
    getUserData();
  }

  Future<UserProfileModel> getUserData() async {
    int? id  = await LocalStorage.getUserID();
    UserProfileModel userResponse = await _userProvider!.getUser(id!);
    return userResponse;
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProfileProvider>(context, listen: false);
    return MoreWidget(
      imageUrl: '',
      level: 0,
      getUserDetails: getUserData,
    );
  }
}
