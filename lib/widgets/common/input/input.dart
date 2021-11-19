import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final Image? leading;
  final TextInputAction? textInputAction;
  final Function onchangeFunc;
  final bool obscure;
  final TextInputType? keyboard;

  const Input({
    Key? key,
    this.hintText,
    this.leading,
    this.textInputAction,
    this.obscure = true,
    this.keyboard,
    required this.onchangeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2,
        textInputAction: textInputAction,
        onChanged: (val) => onchangeFunc(val),
        keyboardType: keyboard,
        onSubmitted: (value) {},
        autofocus: false,
        obscureText: obscure,
        decoration: InputDecoration(
            icon: leading,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2),
      ),
    );
  }
}
