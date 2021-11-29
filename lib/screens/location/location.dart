import 'package:flutter/material.dart';
import 'package:hynzo/containers/location_container.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationContainer(),
    );
  }
}
