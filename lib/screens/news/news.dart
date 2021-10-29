import 'package:flutter/material.dart';
import 'package:invent_chat/containers/news_container.dart';
import 'package:invent_chat/themes/colors.dart';

class News extends StatelessWidget {
  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: NewsContainer(),
    );
  }
}
