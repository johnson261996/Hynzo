import 'package:flutter/material.dart';
import 'package:invent_chat/containers/event_container.dart';
import 'package:invent_chat/resources/strings.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventContainer(),
    );
  }
}
