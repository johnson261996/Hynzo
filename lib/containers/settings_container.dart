import 'package:flutter/material.dart';
import 'package:hynzo/core/models/settings_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/providers/settings_provider.dart';
import 'package:hynzo/providers/user_profile_provider.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/settings/settings_widget.dart';
import 'package:provider/provider.dart';

class SettingsContainer extends StatefulWidget {
  const SettingsContainer({Key? key}) : super(key: key);

  @override
  State<SettingsContainer> createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  static SettingsProvider? _settingsProvider;
  SettingsModel settingsDatas = SettingsModel();
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

  Future<void> getUserData() async {
    try {
      setState(() {
        isLoading = true;
      });
      UserProfileModel userProfileModel = await _userProvider!.getUser();
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

  Future<SettingsModel> getSettingsData() async {
    SettingsModel settingsModel = await _settingsProvider!.getSettings();
    return settingsModel;
  }

  Future<Map<String, dynamic>> setSettingsData(bool nightMode, bool ghostMode,
      bool onlineMode, bool muteMode, bool msgReadMode) async {
    Map<String, dynamic> settingsModel = await _settingsProvider!
        .setSettings(nightMode, ghostMode, onlineMode, muteMode, msgReadMode);
    return settingsModel;
  }

  @override
  Widget build(BuildContext context) {
    _settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
    return SettingsWidget(
      imageUrl: '',
      level: 0,
      userDetails: _userProvider!.userProfileModel,
      settingsDetails: getSettingsData,
      setDetails: setSettingsData,
    );
  }
}
