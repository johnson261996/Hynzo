import 'package:flutter/material.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/providers/update_profile_provider.dart';
import 'package:hynzo/providers/user_profile_provider.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/edit-profile/edit_profile_widget.dart';
import 'package:provider/provider.dart';

class EditProfileContainer extends StatefulWidget {
  const EditProfileContainer({Key? key}) : super(key: key);

  @override
  State<EditProfileContainer> createState() => _EditProfileContainerState();
}

class _EditProfileContainerState extends State<EditProfileContainer> {
  static UserProfileProvider? _userProvider;
  static UpdateProfileProvider? _updateProvider;
  UserProfileModel userDatas = UserProfileModel();
  UserProfileModel userDetails = UserProfileModel();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userProvider = Provider.of<UserProfileProvider>(context, listen: false);
    _updateProvider =
        Provider.of<UpdateProfileProvider>(context, listen: false);
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      setState(() {
        isLoading = true;
      });
      int? id = await LocalStorage.getUserID();
      UserProfileModel userProfileModel = await _userProvider!.getUser(id!);
      if (userProfileModel.statusCode == 200) {
        setState(() {
          userDatas = userProfileModel;
        });
      } else {
        ToastUtil().showToast("Something went wrong.3");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<void> _update(String fullName, String mobile, String gender,
      String gender_detail, String dob, String avatar) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserProfileModel userProfile = await _updateProvider!
          .update(fullName, mobile, gender, gender_detail, dob, avatar);
      if (userProfile.statusCode == 200) {
        setState(() {
          userDetails = userProfile;
        });
        _userProvider!.setUserProfileDetails(userDetails);
      } else {
        ToastUtil().showToast("Something went wrong.3");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProfileProvider>(context);

    return EditProfileWidget(
        userDetails: _userProvider!.userProfileModel, updateProfile: _update);
  }
}
