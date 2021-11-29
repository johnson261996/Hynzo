import 'package:flutter/material.dart';
import 'package:hynzo/widgets/more/more_widget.dart';

class MoreContainer extends StatefulWidget {
  const MoreContainer({Key? key}) : super(key: key);

  @override
  State<MoreContainer> createState() => _MoreContainerState();
}

class _MoreContainerState extends State<MoreContainer> {

  @override
  Widget build(BuildContext context) {
    return MoreWidget();
  }
}
