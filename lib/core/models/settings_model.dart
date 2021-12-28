class SettingsModel {
  bool? nightMode;
  bool? ghostMode;
  bool? onlineMode;
  bool? muteMode;
  bool? msgReadMode;
  int? statusCode;
  SettingsModel(
      {this.nightMode,
      this.ghostMode,
      this.onlineMode,
      this.muteMode,
      this.msgReadMode,
      this.statusCode});

  factory SettingsModel.fromJson(Map<String, dynamic> json, int code) {
    return SettingsModel(
        nightMode: json["night_mode"],
        ghostMode: json["ghost_mode"],
        onlineMode: json["online_mode"],
        muteMode: json["mute_mode"],
        msgReadMode: json["msg_read_mode"],
        statusCode: code);
  }
}
