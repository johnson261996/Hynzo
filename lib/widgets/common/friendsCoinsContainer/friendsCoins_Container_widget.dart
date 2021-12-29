import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class FriendsCoinsContainer extends StatelessWidget {
  String number = '';
  String text = '';

  FriendsCoinsContainer({required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
        color: AppColors.grey_primary,
        fontSize: 14,
        fontWeight: FontWeight.w400);
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      height: 55,
      width: (size.width - 60) / 2,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        Text(
          number,
          style: textStyle.copyWith(fontSize: 24),
        ),
        Text(
          text,
          style: textStyle,
        )
      ]),
    );
  }
}
