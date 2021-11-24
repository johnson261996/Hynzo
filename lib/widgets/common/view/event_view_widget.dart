import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/rectangle_image_view.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';

class EventContainerWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final bool showDate;
  final String dateTime;
  final bool showSubTitle;
  final bool forEvents;

  const EventContainerWidget({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.showDate,
    required this.dateTime,
    required this.showSubTitle,
    required this.forEvents,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            RectangleImageView(
              imagePath: imagePath,
            ),
            if (showDate) ...[
              Positioned(
                top: forEvents
                    ? mediaQuery.height * 0.192
                    : mediaQuery.height * 0.172,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/black_rectangle.png',
                    fit: BoxFit.contain,
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
                          fontSize: 12,
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
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
          ),
          if (showSubTitle) ...[
            SizedBox(
              height: mediaQuery.height * 0.005,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 8,
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
