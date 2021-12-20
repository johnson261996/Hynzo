import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:hynzo/core/models/chat_list_model.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localStorage.dart';
import 'package:path/path.dart' as Path;

class ChatService {
  Future<ChatListModel> getAllChats({int? limit, int? offset}) async {
    String url = 'api/v1/chats/?limit=$limit&offset=$offset';
    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${await getToken()}'
    });
    log(response.body);
    if (jsonDecode(response.body)['message'] == 'chat_list is empty') {
      return ChatListModel(results: []);
    }
    return ChatListModel.fromJson(jsonDecode(response.body));
  }

  Future<CreateChannelModel> createChannel(
      {required List<String> participants, required bool isGroup}) async {
    String url = 'api/v1/chats/create';
    var response = await ServiceBase.post(url: url, data: {
      'participants': participants,
      'is_group': isGroup
    }, headers: {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${await getToken()}'
    });
    log(participants.toString());
    log(response.body);
    if (response.statusCode != 201) {
      return CreateChannelModel(
          id: 0,
          messages: '',
          participants: [],
          isGroup: false,
          encryptionKey: '');
    }
    return CreateChannelModel.fromJson(jsonDecode(response.body));
  }

  Future<Map<String, dynamic>> setUserStatus({required bool status}) async {
    String url = 'api/v1/users/set_status';
    var response = await ServiceBase.post(url: url, data: {
      'status': '$status',
    }, headers: {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${await getToken()}'
    });
    log(response.body);
    return jsonDecode(response.body);
  }

  Future<Map> uploadImage(file, fileName, url) async {
    String apiUrl = ServiceBase.getApiBaseUrl() + url;
    var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
    var stream = http.ByteStream(file!.openRead());
    stream.cast();
    var length = await file.length();
    var multipartFile = http.MultipartFile(fileName, stream, length,
        filename: Path.basename(file.path));
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      "Authorization": await getToken()
    });
    request.files.add(multipartFile);
    var streamResponse = await request.send();
    var res = await http.Response.fromStream(streamResponse);
    return jsonDecode(res.body);
  }

  Future<String> getToken() async {
    String? token = await LocalStorage.getLoginToken();
    return token ?? '';
  }
}
