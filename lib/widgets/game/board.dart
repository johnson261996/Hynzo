import 'package:flutter/material.dart';

class BoardGames extends StatelessWidget {
  const BoardGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Board Games',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
