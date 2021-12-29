import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Widget? leading;
  final Function onchangeFunc;
  final TextInputType? keyboard;
  final String? text;

  const TextFieldWidget(
      {Key? key,
      required this.controller,
      this.leading,
      this.keyboard,
      required this.onchangeFunc,
      this.text})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: AppColors.grey_primary,
            fontWeight: FontWeight.w400,
            fontSize: 13),
        textInputAction: TextInputAction.done,
        onChanged: (val) => widget.onchangeFunc(val),
        keyboardType: widget.keyboard,
        autofocus: false,
        decoration: InputDecoration(
            icon: widget.leading,
            border: InputBorder.none,
            hintText: widget.text),
      ),
    );
  }
}
