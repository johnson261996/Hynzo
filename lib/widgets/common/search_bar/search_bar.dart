import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';

class SearchBar extends StatelessWidget{

  final String hintText;
  final Function onchangeFunc;
  final EdgeInsetsGeometry padding;

  const SearchBar({
    Key? key,
    required this.hintText,
    required this.onchangeFunc,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        alignment: Alignment.center,
        height: 45.0,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText2,
          textInputAction: TextInputAction.done,
          onChanged: (val) => onchangeFunc(val),
          keyboardType: TextInputType.text,
          onSubmitted: (value) {},
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            icon: Image.asset('assets/images/search.png'),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2!.apply(
              color: AppColors.lightgray,
            ),
          ),
        ),
      ),
    );
  }

}