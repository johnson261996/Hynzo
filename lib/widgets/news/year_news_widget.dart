import 'package:flutter/material.dart';

class YearNewsWidget extends StatelessWidget{
  const YearNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Yearly news',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}