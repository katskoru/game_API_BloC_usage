import 'package:flutter/material.dart';

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
    ),
  ),
  AppTheme.lightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.black,
    ),
  ),
};
