import 'package:flutter/material.dart';

class CallsWidget extends StatelessWidget{
  const CallsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Calls',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}