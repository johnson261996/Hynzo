import 'package:flutter/material.dart';

class SuggestedWidget extends StatelessWidget{
  const SuggestedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Suggested',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

}