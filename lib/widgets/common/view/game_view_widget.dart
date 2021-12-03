import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';

class GameContainerWidget extends StatelessWidget {
  final String imagePath;
  final String name;

  const GameContainerWidget({
    required this.imagePath,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SquareViewWidget(
          imagePath: imagePath,
        ),
        SizedBox(
          height: 10,
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
