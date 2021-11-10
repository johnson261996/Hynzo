// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:invent_chat/providers/news_provider.dart';
// import 'package:invent_chat/themes/colors.dart';
// import 'package:invent_chat/widgets/common/loading_overlay/loading_overlay.dart';

// class NewsContainer extends StatelessWidget {
//   static late NewsProvider _newsProvider;

//   void getNews(page) async {
//     page < 2 ?? _newsProvider.changeLoadingStatus(true);
//     _newsProvider.fetchNews(page);
//     _newsProvider.changeLoadingStatus(false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     _newsProvider = Provider.of<NewsProvider>(context);

//     return LoadingOverlay(
//       progressIndicator: CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
//         backgroundColor: AppColors.white,
//         strokeWidth: 5.00,
//       ),
//       child: const Text("data"),
//       // child: NewsWidget(
//       //   data: _newsProvider.newsData,
//       //   getNews: getNews,
//       //   isLoading: _newsProvider.isLoading,
//       // ),
//       isLoading: _newsProvider.isLoading,
//     );
//   }
// }
