import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/appBar/custom_app_bar.dart';

/// [BaseLayout] maintains the basic App Skeleton.
/// It Includes AppBar, Bottom Navigation and the routed Page.
/// [BaseLayout] widget renders the page is Authenticated else Login Page.
/// Use [BaseLayout] page like this:
/// ```dart
///  BaseLayout({
///    page: Text('Login'),
///  });
/// ```
///

class BaseLayout extends StatefulWidget {
  final Widget? page;
  final bool? isAppBar;
  final String text;

  const BaseLayout({
    this.page,
    this.isAppBar,
    this.text = "",
  });

  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppBar!
          ? CustomAppBar(
              title: Text(widget.text),
              backgroundColor: AppColors.primaryDark,
            )
          : null,
      // drawer: CustomDrawer(),
      body: widget.page,
    );
  }
}
