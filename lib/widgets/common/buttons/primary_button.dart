import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

/// Use [PrimaryButton] where in the places of common Raised Button.
/// Needs text, onPressed Function, disabled flag.
/// Have Solid background with white or other color as text color.
/// Use [PrimaryButton] like this:
/// For child <Widget>
///
///  PrimaryButton({
///    text: 'login',
///    onPressed: () => login(),
///    disabled: false,
///  });
///  ```


class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final bool disabled;
  final Widget text;

  const PrimaryButton({
    required this.onPressed,
    this.disabled = false,
    this.text = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          child: text,
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: disabled ? null : onPressed as void Function()?,
      ),
    );
  }
}
