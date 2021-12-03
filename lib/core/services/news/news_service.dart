import 'dart:convert';

import 'package:hynzo/core/models/news_home_model.dart';

import '../service_base.dart';

class NewsService {

  static Future<NewsResponseModel> getAllNews(String token) async {
    String url = 'api/v1/news/fetch/news';
    Map data = {
      "category" : "all",
    };
    var response = await ServiceBase.post(
        url: url, data :data, headers: {"Content-Type": "application/json","Authorization":"Bearer $token"});

    if(response.statusCode != 200){
      throw "Something went wrong";
    }
    return NewsResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }

}