///Provider for uploading avatar image

import 'package:flutter/material.dart';
import 'package:hynzo/core/models/upload_avatar_model.dart';
import 'package:hynzo/core/services/upload_avatar_service.dart';
import 'package:image_picker/image_picker.dart';

class UploadAvatarProvider extends ChangeNotifier {
  bool isLoading = false;

  void changeLoadingStatus(bool loading) {
    Future.delayed(Duration(milliseconds: 300), () {
      isLoading = loading;
      notifyListeners();
    });
  }

  Future<UploadAvatarResponse> upload(XFile file, url) async {
    final UploadAvatarResponse response =
        await AvatarUploadService().uploadImage(file, url);
    notifyListeners();
    return response;
  }
}
