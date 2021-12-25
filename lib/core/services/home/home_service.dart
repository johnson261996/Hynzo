import 'dart:convert';
import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:hynzo/core/models/upload_content_model.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../service_base.dart';

class HomeService {
  Future<UploadResponse> uploadImage(XFile file, fileName, url) async {
    String apiUrl = ServiceBase.apiBaseUrl + url;
    var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
    var stream = http.ByteStream(file.openRead());
    stream.cast();
    var length = await file.length();
    var multipartFile = http.MultipartFile(fileName, stream, length,
        filename: path.basename(file.path));
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      "Authorization": 'Bearer ${await getToken()}',
    });
    request.fields.addAll({
      'type_of_content': 'image',
      'extention': 'png',
    });
    request.files.add(multipartFile);
    var streamResponse = await request.send();
    var res = await http.Response.fromStream(streamResponse);
    log(res.body);
    return UploadResponse.fromJson(jsonDecode(res.body));
  }

  Future<UploadResponse> uploadSticker(String file, fileName, url) async {
    String apiUrl = ServiceBase.apiBaseUrl + url;
    var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
    var bytes = (await rootBundle.load(file)).buffer.asUint8List();
    var multipartFile = http.MultipartFile.fromBytes(fileName, bytes,
        filename: 'sticker_image.png');
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      "Authorization": 'Bearer ${await getToken()}',
    });
    request.fields.addAll({
      'type_of_content': 'image',
      'extention': 'png',
    });
    request.files.add(multipartFile);
    var streamResponse = await request.send();
    var res = await http.Response.fromStream(streamResponse);
    log(res.body);
    return UploadResponse.fromJson(jsonDecode(res.body));
  }

  Future<UploadResponse> uploadPicService(XFile profilePic) async {
    String url = 'api/v1/contents/upload';
    return uploadImage(profilePic, 'content', url);
  }

  Future<UploadResponse> uploadStickerService(String filePath) async {
    String url = 'api/v1/contents/upload';
    return uploadSticker(filePath, 'content', url);
  }

  Future<Map<String, dynamic>> setFcmToken(String token) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String deviceId = androidInfo.androidId!;
    Map data = {'registration_id': token, 'application_id': 'AND$deviceId'};
    String url = 'api/v1/notifications/fcm_token';
    var response = await ServiceBase.post(url: url, data: data, headers: {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${await getToken()}',
    });
    log(response.body);
    return jsonDecode(response.body);
  }

  Future<String> getToken() async {
    String? token = await LocalStorage.getLoginToken();
    return token ?? '';
  }
}
