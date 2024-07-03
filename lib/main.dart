import 'package:Casca/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);
    return MaterialApp.router(
      title: 'Casca',
      themeMode: ThemeMode.system,
      theme: CascaTheme.lightTheme,
      darkTheme: CascaTheme.darkTheme,
      routerConfig: CascaRouter().router,
    );
  }
}
