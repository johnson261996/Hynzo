///service created for uploading avatar image

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hynzo/core/models/upload_avatar_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:image_picker/image_picker.dart';

class AvatarUploadService {
  Future<UploadAvatarResponse> uploadImage(XFile file, url) async {
    String apiUrl = ServiceBase.apiBaseUrl + url;
    var request = http.MultipartRequest("PATCH", Uri.parse(apiUrl));
    var stream = http.ByteStream(file.openRead());
    stream.cast();
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      "Authorization": 'Bearer ${await getToken()}',
    });
    request.files.add(await http.MultipartFile.fromPath('avatar', file.path));
    var streamResponse = await request.send();
    var res = await http.Response.fromStream(streamResponse);
    print(res.body);
    return UploadAvatarResponse.fromJson(jsonDecode(res.body));
  }

  Future<UploadAvatarResponse> uploadPicService(XFile avatar) async {
    String url = 'api/v1/users/profiles/upload_avatar/${await getId()}';
    return uploadImage(avatar, url);
  }

  Future<String> getToken() async {
    String? token = await LocalStorage.getLoginToken();
    return token ?? '';
  }

  Future<int> getId() async {
    int? id = await LocalStorage.getUserID();
    return id ?? 0;
  }
}
