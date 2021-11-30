import 'package:flutter/material.dart';

class RectangleImageView extends StatelessWidget{

  final String imagePath;

  const RectangleImageView({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

}