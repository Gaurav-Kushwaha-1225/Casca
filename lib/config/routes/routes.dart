import 'dart:convert';

import 'package:Casca/features/authentication/presentation/pages/authentication_login_page.dart';
import 'package:Casca/features/authentication/presentation/pages/authentication_onboarding_page.dart';
import 'package:Casca/features/authentication/presentation/pages/authentication_signup_page.dart';
import 'package:Casca/screens/login_page/forgot_password_1/forgot_password_1.dart';
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
        name: CascaRoutesNames.authOnboardingPage,
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const AuthenticationOnboardingPage());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.authSignupPage,
        path: "/authSignupPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const AuthenticationSignupPage());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.authLoginPage,
        path: "/authLoginPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const AuthenticationLoginPage());
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
