import 'package:Casca/utils/consts.dart';
import 'package:flutter/material.dart';

// enum CurrentTheme { dark, light }

class CascaTheme {
  CascaTheme._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Constants.darkSecondary,
      brightness: Brightness.dark,
      primary: Constants.lightPrimary,
      secondary: Constants.darkSecondary,
    ),
    scaffoldBackgroundColor: Constants.darkPrimary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Constants.lightPrimary
      )
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Constants.darkPrimary
    )
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Constants.lightSecondary,
      brightness: Brightness.light,
      primary: Constants.darkPrimary,
      secondary: Constants.lightSecondary,
    ),
    scaffoldBackgroundColor: Constants.lightPrimary,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Constants.darkPrimary
          )
      ),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Constants.lightPrimary
      )
  );
}
