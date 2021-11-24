import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

/// Use [SecondaryButton] where in the places of common Raised Button.
/// Needs text, onPressed Function, disabled flag.
/// Have Solid background with white or other color as text color.
/// Use [SecondaryButton] like this:
/// For child <Widget>
///
///  SecondaryButton({
///    text: 'login',
///    onPressed: () => login(),
///    disabled: false,
///  });
///  ```

class SecondaryButton extends StatelessWidget {
  final Function onPressed;
  final bool disabled;
  final Widget text;

  const SecondaryButton({
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
          backgroundColor: AppColors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          child: text,
          decoration: BoxDecoration(
            border: Border.all(
              color: disabled ? AppColors.gray : AppColors.primaryDark,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: disabled ? null : onPressed as void Function()?,
      ),
    );
  }
}
