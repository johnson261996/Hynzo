
import 'package:flutter/material.dart';
import 'package:hynzo/containers/edit_home_container.dart';

class EditHome extends StatelessWidget {

   EditHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditHomeContainer(),
    );
  }
}