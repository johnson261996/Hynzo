import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';

class Themes {
  Themes._();

  static final ThemeData baseTheme = ThemeData.light();

  static ThemeData buildLightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _buildAppBarTheme(),
      textTheme: _buildLightTextTheme(),
      buttonTheme: _buildButtonTheme(),
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
    );
  }

  static ButtonThemeData _buildButtonTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 60,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColors.white,
        secondary: AppColors.primaryDark,
      ),
    );
  }

  static TextTheme _buildLightTextTheme() {
    return baseTheme.textTheme
        .copyWith(
            headline1: baseTheme.textTheme.headline1!.copyWith(
              color: AppColors.primaryDark,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
            headline2: baseTheme.textTheme.headline2!.copyWith(
              color: AppColors.grayDark,
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),
            headline3: baseTheme.textTheme.headline3!.copyWith(
              color: AppColors.grayDark,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            headline4: baseTheme.textTheme.headline4!.copyWith(
              color: AppColors.grayDark,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            headline5: baseTheme.textTheme.headline5!.copyWith(
              color: AppColors.blackBlue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            headline6: baseTheme.textTheme.headline6!.copyWith(
              color: AppColors.grayDark,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subtitle1: baseTheme.textTheme.subtitle1!.copyWith(
              color: AppColors.primaryLight,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            subtitle2: baseTheme.textTheme.subtitle2!.copyWith(
              color: AppColors.grayDark,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            bodyText1: baseTheme.textTheme.bodyText1!.copyWith(
              color: AppColors.primaryDark,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            bodyText2: baseTheme.textTheme.bodyText2!.copyWith(
              color: AppColors.grayDark,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            button: baseTheme.textTheme.button!.copyWith(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            caption: baseTheme.textTheme.caption!.copyWith(
              color: AppColors.primaryDark,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ))
        .apply(
      fontFamily: 'sf_pro_display',
    );
  }
}
