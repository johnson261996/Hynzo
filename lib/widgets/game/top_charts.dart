import 'package:flutter/material.dart';

class TopCharts extends StatelessWidget{
  const TopCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Top Charts Games',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }


}