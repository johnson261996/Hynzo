import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget widget;

  const TextFieldContainer({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey_primary.withOpacity(0.15),
                spreadRadius: 1.8,
                blurRadius: 1,
                offset: Offset(0, 0),
              ),
            ]),
        child: widget);
  }
}
