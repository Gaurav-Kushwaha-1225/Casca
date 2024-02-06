import 'package:casca/utils/routes.dart';
import 'package:casca/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Casca',
      themeMode: ThemeMode.system,
      theme: CascaTheme.lightTheme,
      darkTheme: CascaTheme.darkTheme,
      routerConfig: CascaRouter().router,
    );
  }
}
