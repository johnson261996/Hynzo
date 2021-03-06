import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/rectangle_image_view.dart';



class EventContainerWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final bool showDate;
  final String dateTime;
  final bool showSubTitle;

  const EventContainerWidget({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.showDate,
    required this.dateTime,
    required this.showSubTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        Stack(
          children: [
            RectangleImageView(
              imagePath: imagePath,
            ),
            if (showDate) ...[
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/black_rectangle.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 5.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    dateTime,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                  ),
                ),
              )
            ] else ...[
              Positioned.fill(
                bottom: 5.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            ],
          ],
        ),
        if (showDate) ...[
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
          ),
          if (showSubTitle) ...[
            const SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.offgreylight,
                  ),
            ),
          ]
        ],
      ],
    );
  }
}
