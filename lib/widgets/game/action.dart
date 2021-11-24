import 'package:flutter/material.dart';

class ActionGames extends StatelessWidget{
  const ActionGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Action Games',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}