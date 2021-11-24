import 'package:flutter/material.dart';

class YearWidget extends StatelessWidget{
  const YearWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Year',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}