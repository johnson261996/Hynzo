import 'package:flutter/material.dart';

class WeeekNewsWidget extends StatelessWidget{
  const WeeekNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Weekly news',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}