import 'package:flutter/material.dart';

class RequestedWidget extends StatelessWidget {
  const RequestedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          'Requested',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
