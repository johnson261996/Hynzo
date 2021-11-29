import 'package:flutter/material.dart';
import 'package:hynzo/containers/event_container.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EventContainer());
  }
}
