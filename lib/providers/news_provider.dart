import 'dart:async' show Future;
import 'package:flutter/foundation.dart';
import 'package:hynzo/core/models/auth_model.dart';
// import 'package:hynzo/core/services/news/news_services.dart';

class NewsProvider extends ChangeNotifier {
  bool isLoading = true;

  // NewsModel? newsData;

  void fetchNews(page) async {
    // final NewsModel response = await NewsService().fetchNews(page);
    // if (newsData != null && newsData!.articles != null) {
    //   newsData!.articles!.addAll(response.articles!);
    // } else {
    //   newsData = response;
    // }
    isLoading = false;
    notifyListeners();
  }
}
