import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';

class RecentGameWidget extends StatelessWidget {
  final String imagePath;
  final int index;
  final Size mediaQuery;
  final String name;

  const RecentGameWidget({
    required this.imagePath,
    required this.index,
    required this.mediaQuery,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SquareViewWidget(
              imagePath: imagePath,
            ),
            if (index == 0) ...[
              Positioned(
                top: 15.0,
                child: Container(
                  color: AppColors.yellow,
                  width: 35.0,
                  height: 13.0,
                  child: Center(
                    child: Text(
                      Strings.NEW,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 7,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
        SizedBox(
          height: mediaQuery.height * 0.01,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
        )
      ],
    );
  }
}
