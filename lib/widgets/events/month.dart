import 'package:flutter/material.dart';

class MonthWidget extends StatelessWidget{
  const MonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Month',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}