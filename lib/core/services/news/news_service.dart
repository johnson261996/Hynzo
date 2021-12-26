import 'dart:convert';

import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/services/service_base.dart';
import 'package:hynzo/utils/localstorage.dart';

class NewsService {
  static Future<NewsResponseModel> getAllNews() async {
    String token = "";
    await LocalStorage.getLoginToken().then((value) => token = value!);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2");

    String url = 'api/v1/news/fetch/news?category=all&country=in&language=en';

    var response = await ServiceBase.get(url: url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    print("----------------------->>>>>>>>>>>>>>>> 3");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode != 200) {
      throw "Something went wrong";
    }
    return NewsResponseModel.fromJson(
      jsonDecode(response.body),
      response.statusCode,
    );
  }
}
