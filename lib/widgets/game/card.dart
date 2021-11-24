import 'package:flutter/material.dart';

class CardGames extends StatelessWidget{
  const CardGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Card Games',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }


}