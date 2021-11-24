import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/image/square_image_widget.dart';

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
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(name,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        )
      ],
    );
  }
}
