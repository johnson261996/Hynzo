import 'package:flutter/material.dart';

class ConnectedWidget extends StatelessWidget {
  const ConnectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Connected',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
