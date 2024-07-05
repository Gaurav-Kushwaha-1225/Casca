import 'package:Casca/features/authentication/data/data_sources/user_database.dart';
import 'package:Casca/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CascaUsersDB.db();
  runApp(const Casca());
}

class Casca extends StatelessWidget {
  const Casca({super.key});

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
