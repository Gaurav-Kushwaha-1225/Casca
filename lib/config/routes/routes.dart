import 'dart:convert';

import 'package:Casca/features/authentication/presentation/pages/authentication_login_page.dart';
import 'package:Casca/features/authentication/presentation/pages/authentication_onboarding_page.dart';
import 'package:Casca/features/authentication/presentation/pages/authentication_signup_page.dart';
import 'package:Casca/features/authentication/presentation/pages/forgot_password_1.dart';
import 'package:Casca/features/authentication/presentation/pages/profile_setup.dart';
import 'package:Casca/features/dashboard/presentation/pages/dashboard.dart';
import 'package:Casca/features/dashboard/presentation/widgets/barber_details/details_page_1.dart';
import 'package:Casca/features/dashboard/presentation/widgets/edit_profile_page.dart';
import 'package:Casca/features/dashboard/presentation/widgets/home_service_page.dart';
import 'package:Casca/features/dashboard/presentation/widgets/notification_bookmark_page.dart';
import 'package:Casca/screens/splash_screen.dart';
import '../../screens/testing_page/testing_page.dart';
import 'package:Casca/config/routes/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/forgot_password_2.dart';
import '../../features/authentication/presentation/pages/forgot_password_3.dart';

class CascaRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: CascaRoutesNames.splashScreen,
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const SplashScreen());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.authOnboardingPage,
        path: "/authOnboardingPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey, child: const AuthenticationOnboardingPage());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.authSignupPage,
        path: "/authSignupPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey, child: const AuthenticationSignupPage());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.authLoginPage,
        path: "/authLoginPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey, child: const AuthenticationLoginPage());
        },
      ),
      GoRoute(
        name: CascaRoutesNames.profileSetup,
        path: "/profileSetup/:email/:password/:rememberMeCheckbox",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: ProfileSetup(
                email: jsonDecode(state.pathParameters['email']!),
                password: jsonDecode(state.pathParameters['password']!),
                rememberMeCheckbox:
                    jsonDecode(state.pathParameters['rememberMeCheckbox']!),
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
        name: CascaRoutesNames.dashboard,
        path: "/dashboard/:user",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey,
              child: DashboardPage(
                  user: jsonDecode(state.pathParameters['user']!)));
        },
      ),
      GoRoute(
        name: CascaRoutesNames.testingPage,
        path: "/testingPage",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const TestingPage());
        },
      ),
      GoRoute(
          name: CascaRoutesNames.servicesPage,
          path: "/service_page/:service",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
                key: state.pageKey,
                child: HomeServicePage(
                    service: jsonDecode(state.pathParameters['service']!)));
          }),
      GoRoute(
          name: CascaRoutesNames.notificationBookmarkPage,
          path: "/notification_bookmark_page/:service",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
                key: state.pageKey,
                child: NotificationBookmarkPage(
                    service: jsonDecode(state.pathParameters['service']!)));
          }),
      GoRoute(
          name: CascaRoutesNames.barberDetailsPage1,
          path: "/barber_details_page_1/:barberJson",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
                key: state.pageKey,
                child: BarberDetailsPage1(
                    barberJson:
                        jsonDecode(state.pathParameters['barberJson']!)));
          }),
      GoRoute(
          name: CascaRoutesNames.updateUserPage,
          path: "/update_user_page/:user",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
                key: state.pageKey,
                child: EditProfilePage(
                    user: jsonDecode(state.pathParameters['user']!)));
          }),
    ], // TODO: Add Error Page Builder
  );
}
