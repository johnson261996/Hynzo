import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class NoDataError extends StatelessWidget {
  const NoDataError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
        color: AppColors.white,
        width: mediaQuery.width,
        height: mediaQuery.height,
     child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        Text('We move under cover and we move as one'),
        Image.asset(
            "assets/images/error_503.jpg",
            height: 30,
          ),
    ]),
    );
  }


}
