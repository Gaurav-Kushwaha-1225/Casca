import 'package:casca/screens/login_page/login_page_1.dart';
import 'package:casca/utils/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CascaRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: CascaRoutesNames.loginPage1,
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const LoginPage1());
        },
      ),
    ], // TODO: Add Error Page Builder
  );
}
