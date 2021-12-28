import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Color fillColor;
  final Color borderColor;
  final String text;
  final TextStyle style;
  final Function onPressed;

  CustomTextButton({
    required this.fillColor,
    required this.borderColor,
    required this.text,
    required this.style,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor,width: 1),
          color: fillColor,
          borderRadius:
          const BorderRadius.all(Radius.circular(15))),
      height: 50,
      width: size.width - 40,
      child: TextButton(
        onPressed: (){
          onPressed();
        },
        child: Text(text,
            style: style),
      ),
    );

  }
}
