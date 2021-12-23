import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class DropDownWidget extends StatefulWidget {

  final String hintText ;
  String dropText ;
   DropDownWidget({
    required this.hintText,
     required this.dropText
});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(
        color: AppColors.grey_primary,
        fontWeight: FontWeight.w400,
        fontSize: 13);
    return DropdownButton(
        icon: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.keyboard_arrow_down,color: AppColors.gray_arrow,
          ),
        ),
        hint: widget.dropText == ''
            ? Text(widget.hintText,
            style: style)
            : Text(widget.dropText,
            style: style),
        isExpanded: true,
        underline: SizedBox(),
        items: ['Male', 'Female', 'Others'].map(
              (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(
                      color: AppColors.grey_primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 13)),
            );
          },
        ).toList(),
        onChanged: (val) {
          setState(
                () {
              widget.dropText = val as String;
            },
          );
        });
  }
}
