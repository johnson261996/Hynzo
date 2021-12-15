import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/providers/news_provider.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/news/news_widget.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  static NewsProvider? _newsProvider;
  List<NewsDataModel> allNews = [];
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsProvider = Provider.of<NewsProvider>(context, listen: false);
    allNews.clear();
    // ConnectionStaus().check().then((connectionStatus) {
    //   if (connectionStatus) {
    getAllNews();
    //   } else {
    //     ToastUtil().showToast(
    //         "No internet connection available. Please check your connection or try again later.");
    //   }
    // });
  }

  Future<void> getAllNews() async {
    try {
      setState(() {
        _isLoading = true;
      });
      NewsResponseModel newsResponseModel = await _newsProvider!.getNewsList();
      setState(() {
        _isLoading = false;
      });
      if (newsResponseModel.statusCode == 200) {
        for (var element in newsResponseModel.newsDataList!) {
          allNews.add(element);
        }
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (allNews.length > 0) {
      return LoadingOverlay(
        isLoading: _isLoading,
        color: AppColors.gray,
        child: NewsWidget(
          allNews: allNews,
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
