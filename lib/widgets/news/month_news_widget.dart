import 'package:flutter/material.dart';

class MonthNewsWidget extends StatelessWidget{
  const MonthNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Monthly News',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}