import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final IconData? leading;
  final Function onchangeFunc;
  final bool obscure;
  final TextInputType? keyboard;

  const Input({
    Key? key,
    this.hintText,
    this.leading,
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
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.primaryLight)),
      padding: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        onChanged: (val) => onchangeFunc(val),
        keyboardType: keyboard,
        onSubmitted: (value) {},
        autofocus: false,
        obscureText: obscure,
        decoration: InputDecoration(
            icon: Icon(
              leading,
              color: Colors.deepPurple,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.subtitle2),
      ),
    );
  }
}
