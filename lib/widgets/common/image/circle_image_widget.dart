
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget{
  final String imagePath;

  const CircleImageWidget({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Color(0xFF414BA5),
      child: CircleAvatar(
        radius: 35,
        child: ClipOval(
         child: Container(
           padding: EdgeInsets.all(5.0),
           color: Colors.white,
             child: ClipOval(
             child: Image.asset(
                imagePath,
               fit: BoxFit.cover,
               width: 80.0,
               height: 80.0,
              ),
             ),
           ),
         ),
      ),
    );
  }
}