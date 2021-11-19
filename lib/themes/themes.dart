import 'package:flutter/material.dart';
import 'package:invent_chat/themes/colors.dart';

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
      iconTheme: IconThemeData(
        color: AppColors.gray,
      )
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
            color: AppColors.gray,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
          headline2: baseTheme.textTheme.headline2!.copyWith(
            color: AppColors.white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
          headline3: baseTheme.textTheme.headline3!.copyWith(
            color: AppColors.gray,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          headline4: baseTheme.textTheme.headline4!.copyWith(
            color: AppColors.grayDark,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          headline5: baseTheme.textTheme.headline5!.copyWith(
            color: AppColors.grayDark,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headline6: baseTheme.textTheme.headline6!.copyWith(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: baseTheme.textTheme.subtitle1!.copyWith(
            color: AppColors.primaryLight,
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          subtitle2: baseTheme.textTheme.subtitle2!.copyWith(
            color: AppColors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: baseTheme.textTheme.bodyText1!.copyWith(
            color: AppColors.primaryDark,
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          bodyText2: baseTheme.textTheme.bodyText2!.copyWith(
            color: AppColors.black,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
          button: baseTheme.textTheme.button!.copyWith(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          caption: baseTheme.textTheme.subtitle1!.copyWith(
            color: AppColors.blueDark,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
        )
        .apply(
          fontFamily: 'sf_pro_display',
        );
  }
}
