import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';

class ErrorText extends StatelessWidget {
  final String errorMgs;

  const ErrorText({
    Key? key,
    required this.errorMgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('---------------------$errorMgs');
    return errorMgs != ""
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              errorMgs,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .apply(color: AppColors.error),
            ),
          )
        : const Text('');
  }
}
