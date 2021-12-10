import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final String imageUrl;
  final int level;
  const ProfileImageWidget({Key? key,required this.imageUrl,required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          child: CircularProgressIndicator(value:0.6,backgroundColor: AppColors.offyellow,valueColor:  AlwaysStoppedAnimation<Color>(AppColors.darkyellow,),),
        ),
        Positioned(
          top: 1.0,
          bottom: 1.0,
          right: 1.0,
          left: 1.0,
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage:NetworkImage(
              imageUrl,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10.0,
          right: 8.0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 12.0,
              height: 12.0,
              child: Image.asset(
                'assets/images/profile_star.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10.5,
          right: 10.5,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              level.toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 9,
                    color: AppColors.yellowDark,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
