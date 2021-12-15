

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cross_file/src/types/interface.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:path/path.dart' as Path;
import '../service_base.dart';

class HomeService {

  Future<Map> uploadImage(file, fileName, url) async {
    String apiUrl = ServiceBase.apiBaseUrl + url;
    var request = http.MultipartRequest("PATCH", Uri.parse(apiUrl));
    var stream = http.ByteStream(file!.openRead());
    stream.cast();
    var length = await file.length();
    var multipartFile = http.MultipartFile(fileName, stream, length,
        filename: Path.basename(file.path));
    request.headers.addAll(
        {"Content-Type": "multipart/form-data", "Authorization": getToken()});
    request.files.add(multipartFile);
    var streamResponse = await request.send();
    var res = await http.Response.fromStream(streamResponse);
    return jsonDecode(res.body);
  }

  Future<Map> postTodProfilePicService(XFile? profilePic) async {
    String? profileId = LocalStorage.getUserID().toString();
    String url = '/api/v1/users/profiles/upload_avatar/:=$profileId';
    return uploadImage(profilePic, 'profile_pic', url);
  }

  String getToken() {
    //get access token
    String? token = LocalStorage.getLoginToken().toString();
    return token;
  }
}
