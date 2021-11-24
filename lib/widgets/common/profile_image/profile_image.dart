import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';

class ProfileImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          child: Image.asset(
            'assets/images/profile_image_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 4.0,
          bottom: 4.0,
          right: 4.0,
          left: 4.0,
          child: Container(
            width: 65.0,
            height: 65.0,
            child: Image.asset(
              'assets/images/profile_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 45.0,
          bottom: 5.0,
          right: 5.0,
          left: 45.0,
          child: Container(
            width: 8.0,
            height: 8.0,
            child: Image.asset(
              'assets/images/profile_star.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 50.0,
          bottom: 5.0,
          right: 5.0,
          left: 52.0,
          child: Text(
            '2',
            style: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: 9,
              color: AppColors.yellowDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

}