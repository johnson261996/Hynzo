import 'package:flutter/material.dart';
import 'package:hynzo/containers/news_container.dart';

class News extends StatelessWidget {
  final bool? isBackEnable;

  const News({
    Key? key,
    this.isBackEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsContainer(isBackEnable: isBackEnable),
    );
  }
}
