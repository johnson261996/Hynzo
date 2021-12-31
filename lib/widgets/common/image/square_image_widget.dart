import 'package:flutter/material.dart';
import 'package:hynzo/resources/images.dart';

class SquareViewWidget extends StatelessWidget{

  final String imagePath;

  const SquareViewWidget({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child:Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 105.0,
        height: 105.0,
      ),
    );
  }

}