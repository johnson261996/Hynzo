import 'package:flutter/material.dart';
import 'package:invent_chat/resources/strings.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(Strings.EVENTS,
          style: Theme.of(context).textTheme.headline1),
    ));
  }
}
