import 'package:flutter/material.dart';

class WeeekWidget extends StatelessWidget{
  const WeeekWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Week',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}