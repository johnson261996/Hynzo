import 'package:flutter/material.dart';

class TommorrowNewsWidget extends StatelessWidget{
  const TommorrowNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Tommorrow news',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}