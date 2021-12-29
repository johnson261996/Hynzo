///Provider for getting user details
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/settings_model.dart';
import 'package:hynzo/core/services/settings_service.dart';

class SettingsProvider extends ChangeNotifier {
  bool isLoading = false;
  late SettingsModel settingsModel = SettingsModel();

  void changeLoadingStatus(bool loading) {
    Future.delayed(Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<SettingsModel> getSettings() async {
    final SettingsModel response = await SettingsService.getSettings();
    settingsModel = response;
    notifyListeners();
    return response;
  }

  Future<Map<String, dynamic>> setSettings(bool nightMode, bool ghostMode,
      bool onlineMode, bool muteMode, bool msgReadMode) async {
    final response = await SettingsService.setSettings(
        nightMode, ghostMode, onlineMode, muteMode, msgReadMode);
    notifyListeners();
    return response;
  }
}
