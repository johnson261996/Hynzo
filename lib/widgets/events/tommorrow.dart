import 'package:flutter/material.dart';

class TommorrowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Tommorrow',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}