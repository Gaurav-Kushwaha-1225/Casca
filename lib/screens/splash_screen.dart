import 'dart:convert';

import 'package:Casca/config/routes/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import '../utils/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    _checkUserLoggedIn();
    super.initState();
  }

  Future<void> _checkUserLoggedIn() async {
    // Check if a user token exists
    final token = await _storage.read(key: 'user');

    // Navigate based on the token presence
    if (token != null) {
      GoRouter.of(context)
          .goNamed(CascaRoutesNames.dashboard, pathParameters: {'user': token});
    } else {
      GoRouter.of(context).goNamed(CascaRoutesNames.authOnboardingPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Constants.lightPrimary
          : Constants.darkPrimary,
      body: Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary),
      ),
    );
  }
}
