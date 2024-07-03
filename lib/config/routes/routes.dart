import 'dart:convert';

import 'package:Casca/screens/login_page/forgot_password_1/forgot_password_1.dart';
import 'package:Casca/screens/login_page/login_page_1/login_page_1.dart';
import 'package:Casca/screens/login_page/login_page_2/login_page_2.dart';
import 'package:Casca/screens/login_page/login_page_3/login_page_3.dart';
import 'package:Casca/screens/login_page/profile_setup/profile_setup.dart';
import 'package:Casca/screens/testing_page/testing_page.dart';
import 'package:Casca/config/routes/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/login_page/forgot_password_2/forgot_password_2.dart';
import '../../screens/login_page/forgot_password_3/forgot_password_3.dart';

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
        path: "/profileSetup/:email/:password",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: ProfileSetup(
                email: jsonDecode(state.pathParameters['email']!),
                password: jsonDecode(state.pathParameters['password']!),
              ));
        },
      ),
      GoRoute(
        name: CascaRoutesNames.forgotPassword1,
        path: "/forgotPassword1/:email",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: ForgotPassword1(
                email: jsonDecode(state.pathParameters['email']!),
              ));
        },
      ),
      GoRoute(
        name: CascaRoutesNames.forgotPassword2,
        path: "/forgotPassword2/:isEmail/:codeLink/:id",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: ForgotPassword2(
                isEmail: jsonDecode(state.pathParameters['isEmail']!),
                codeLink: jsonDecode(state.pathParameters['codeLink']!),
                id: jsonDecode(state.pathParameters['id']!),
              ));
        },
      ),
      GoRoute(
        name: CascaRoutesNames.forgotPassword3,
        path: "/forgotPassword3/:id",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: ForgotPassword3(
                id: jsonDecode(state.pathParameters['id']!),
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
