import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/home/edit_home_widget.dart';

class EditHomeContainer extends StatefulWidget {
  @override
  _EditHomeContainerState createState() => _EditHomeContainerState();
}

class _EditHomeContainerState extends State<EditHomeContainer> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: EditHomeWidget(),
    );
  }

  @override
  void initState() {

  }
}
