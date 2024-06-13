import 'dart:convert';

import 'package:casca/screens/login_page/login_page_1/login_page_1.dart';
import 'package:casca/screens/login_page/login_page_2/login_page_2.dart';
import 'package:casca/screens/login_page/login_page_3/login_page_3.dart';
import 'package:casca/screens/login_page/profile_setup/profile_setup.dart';
import 'package:casca/screens/testing_page/testing_page.dart';
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
      GoRoute(
        name: CascaRoutesNames.loginPage2,
        path: "/loginPage2",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const LoginPage2());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.loginPage3,
        path: "/loginPage3",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const LoginPage3());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.profileSetup,
        path: "/profileSetup/:email",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: ProfileSetup(
                email: jsonDecode(state.pathParameters['email']!),
              ));
        },
      ),
      GoRoute(
        name: CascaRoutesNames.testingPage,
        path: "/testingPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const TestingPage());
        },
      ),
    ], // TODO: Add Error Page Builder
  );
}
