import 'dart:async' show runZoned;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hynzo/app.dart';
import 'package:hynzo/themes/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.white, // this one for android
      statusBarBrightness: Brightness.light // this one for iOS
      ));
  runZoned(() {
    runApp(const MyApp());
  });
}
