import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hintText;
  final Widget? leading;
  final Function onchangeFunc;
  final TextInputType? keyboard;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.leading,
    this.keyboard,
    required this.onchangeFunc,
    required this.controller
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: AppColors.grey_primary,
            fontWeight: FontWeight.w400,
            fontSize: 13),
        textInputAction: TextInputAction.done,
        onChanged: (val) => widget.onchangeFunc(val),
        keyboardType: widget.keyboard,
        onSubmitted: (value) {},
        autofocus: false,
        decoration: InputDecoration(
            icon: widget.leading,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: AppColors.grey_primary,
                fontWeight: FontWeight.w400,
                fontSize: 13)),
      ),
    );
  }
}
