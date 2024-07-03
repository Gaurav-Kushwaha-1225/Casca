import 'dart:developer';

import 'package:Casca/screens/login_page/local_widgets/auth_page_divider.dart';
import 'package:Casca/screens/login_page/local_widgets/else_signin_signup_options.dart';
import 'package:Casca/screens/login_page/login_page_1/local_widgets/login_with_widget.dart';
import 'package:Casca/screens/login_page/local_widgets/main_text.dart';
import 'package:Casca/config/routes/routes_consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back_rounded,
          text: "",
          leadingFunc: () {
            log('AppBar BackButton');
            SystemNavigator.pop();
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
              child: SizedBox(
            height: 10,
          )),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? "assets/images/LogLight.png"
                  : "assets/images/LogDark.png",
              fit: BoxFit.contain,
              width: (MediaQuery.of(context).size.width - 170),
            ),
          ),
          const Expanded(
            child: SizedBox(height: 10),
          ),
          const MainText(text: "Let's you in"),
          const Expanded(
            child: SizedBox(
              height: 13,
            ),
          ),
          LoginWithWidget(
              icon: Icon(
                Icons.facebook_rounded,
                color: Colors.blue.shade900,
                size: 32,
              ),
              text: "Continue with Facebook"),
          const SizedBox(
            height: 13,
          ),
          LoginWithWidget(
              icon: Image.asset(
                "assets/images/google_icon.png",
                fit: BoxFit.contain,
                width: 32,
                height: 32,
              ),
              text: "Continue with Google"),
          const SizedBox(
            height: 13,
          ),
          const LoginWithWidget(
              icon: Icon(
                Icons.apple_rounded,
                size: 32,
              ),
              text: "Continue with Apple"),
          const Expanded(
            child: SizedBox(height: 24),
          ),
          const AuthPageDivider(text: "or"),
          const Expanded(
            child: SizedBox(height: 24),
          ),
          ScreenWidthButton(
              text: "Sign in with password",
              route: CascaRoutesNames.loginPage3,
              buttonFunc: () {
                GoRouter.of(context).pushNamed(CascaRoutesNames.loginPage3);
                log("Worked Fine :)");
              }),
          ElseSigninSignupOptions(
            text_1: "Don't have an account? ",
            text_2: " Sign up",
            route: CascaRoutesNames.loginPage2,
            buttonFunc: () {
              GoRouter.of(context).pushNamed(CascaRoutesNames.loginPage2);
            },
          ),
        ],
      ),
    );
  }
}
