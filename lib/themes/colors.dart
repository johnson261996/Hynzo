import 'package:flutter/material.dart';

import 'package:pigment/pigment.dart';

/// Define all the colors to be used in application in this file
/// To use - import this file and call required string by:
///```dart
///      AppColors.<name>
///```
///For Color Names refer: http://chir.ag/projects/name-that-color/#6195ED
class AppColors {
  AppColors._();

  static final Color black = Pigment.fromString('#000000');
  static final Color greyBlack = Pigment.fromString('#1B1A57');
  static final Color greyBlackTypeTwo = Pigment.fromString('#4F5E7B');
  static final Color grayDark = Pigment.fromString('#7A7A7A');
  static final Color gray = Pigment.fromString('#606060');
  static final Color graylight = Pigment.fromString('#B0B0B2');
  static final Color lightgray = Pigment.fromString('#C4C4C4');
  static final Color lightgrayTypeTwo = Pigment.fromString('#7B7B7B');
  static final Color lightergray = Pigment.fromString('#A1A1A1');
  static final Color lightSliver = Pigment.fromString('#E8E8E8');
  static final Color white = Pigment.fromString("#FFFFFF");
  static final Color yellow = Pigment.fromString("#FAFF00");
  static final Color yellowDark = Pigment.fromString("#B5680E");
  static final Color blue = Pigment.fromString("#839CDE");
  static final Color lightblue = Pigment.fromString("#94BDE3");
  static final Color blueDark = Pigment.fromString("#414BA5");
  static final Color pink = Pigment.fromString("#E39494");

  static final Color primary = Pigment.fromString('#4232B0');
  static final Color primaryDark = Pigment.fromString('#414BA5');
  static final Color primaryLight = Pigment.fromString('#9791c4');

  static final Color secondary = Pigment.fromString('#FFB183');
  static final Color secondaryDark = Pigment.fromString('#F2994A');
  static final Color secondaryLight = Pigment.fromString('#FFEADD');

  static final Color error = Pigment.fromString('#F64C4C');
  static final Color success = Pigment.fromString('#007E33');
}
