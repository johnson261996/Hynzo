

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/leaderboard/leaderboard_widget.dart';

class LeaderboardContainer extends StatefulWidget {
  @override
  _LeaderboardContainerState createState() => _LeaderboardContainerState();
}

class _LeaderboardContainerState extends State<LeaderboardContainer> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: LeaderboardWidget(),
    );

  }
}
