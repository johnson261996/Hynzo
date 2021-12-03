import 'dart:async' show Future;
import 'package:flutter/foundation.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/core/services/news/news_service.dart';

class NewsProvider extends ChangeNotifier {

  Future<NewsResponseModel> getNewsList(String token) async {
    final NewsResponseModel response = await NewsService.getAllNews(token);
    notifyListeners();
    return response;
  }

}
