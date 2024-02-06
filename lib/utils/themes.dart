import 'package:casca/utils/consts.dart';
import 'package:flutter/material.dart';

// enum CurrentTheme { dark, light }

class CascaTheme {
  CascaTheme._();

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: Constants.darkPrimary,
    primaryColorDark: Constants.darkSecondary,
    scaffoldBackgroundColor: Constants.darkPrimary,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: Constants.lightPrimary,
    primaryColorDark: Constants.lightSecondary,
    scaffoldBackgroundColor: Constants.lightPrimary,
  );
}
