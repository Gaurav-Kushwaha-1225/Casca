import 'package:Casca/utils/consts.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: TextButton.styleFrom(foregroundColor: Constants.lightPrimary)),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Constants.darkBorderColor,
          contentTextStyle: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Constants.darkTextColor,
              fontStyle: FontStyle.normal)));

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
          style: TextButton.styleFrom(foregroundColor: Constants.darkPrimary)),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Constants.lightBorderColor,
          contentTextStyle: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Constants.lightTextColor,
              fontStyle: FontStyle.normal)));
}

// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// States
class ThemeState {
  final bool isDark;
  ThemeState({required this.isDark});
}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final FlutterSecureStorage storage;

  ThemeBloc({required this.storage}) : super(ThemeState(isDark: false)) {
    on<ToggleTheme>((event, emit) async {
      final newIsDark = !state.isDark;
      await storage.write(key: 'isDark', value: newIsDark.toString());
      emit(ThemeState(isDark: newIsDark));
    });
  }

  // Load saved theme preference
  Future<void> loadSavedTheme() async {
    final isDark = (await storage.read(key: 'isDark')) == "true" ? true : false;
    emit(ThemeState(isDark: isDark));
  }
}
