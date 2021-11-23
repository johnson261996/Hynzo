import 'dart:async' show runZoned;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invent_chat/app.dart';
import 'package:invent_chat/themes/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.white, // this one for android
      statusBarBrightness: Brightness.light// this one for iOS
  ));
  runZoned(() {
    runApp(MyApp());
  });
}
