// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:online_library/tools/colors/onlinelibrary_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.mainWhite,
      cardColor: AppColors.whiteColor,
      canvasColor: AppColors.mainColorWhite,
      disabledColor: AppColors.grey,
      dividerColor: AppColors.mainColorDark,
      highlightColor: AppColors.errorColor,
      shadowColor: Colors.black.withOpacity(0.08),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.mainColorWhite,
      ));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.mainDark,
      cardColor: AppColors.darkColor,
      canvasColor: AppColors.mainColorDark,
      disabledColor: AppColors.grey,
      dividerColor: AppColors.grey100,
      highlightColor: AppColors.errorColor,
      shadowColor: Colors.white.withOpacity(0.08),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.mainColorDark,
      ));
}
