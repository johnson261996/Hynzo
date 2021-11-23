import 'package:flutter/material.dart';

class AdventureGames extends StatelessWidget{
  const AdventureGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Adventure Games',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );;
  }


}