import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';

abstract class AppThemeData {
  static final ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: MyColors.scaffoldBackground,
    fontFamily: "Lexend Deca",
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
  static final ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: MyColors.black,
    fontFamily: "Lexend Deca",
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
