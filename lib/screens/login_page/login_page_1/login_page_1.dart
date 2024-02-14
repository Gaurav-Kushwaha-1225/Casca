import 'dart:developer';

import 'package:casca/screens/login_page/loca_widgets/else_signin_signup_options.dart';
import 'package:casca/screens/login_page/login_page_1/local_widgets/login_with_widget.dart';
import 'package:casca/utils/consts.dart';
import 'package:casca/utils/routes_consts.dart';
import 'package:casca/widgets/app_bar.dart';
import 'package:casca/screens/login_page/loca_widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back_rounded,
          leadingFunc: () {
            log('AppBar BackButton');
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
                  ? "assets/images/1-Light.png"
                  : "assets/images/1-Dark.png",
              fit: BoxFit.contain,
              width: (MediaQuery.of(context).size.width - 170),
            ),
          ),
          const Expanded(
            child: SizedBox(height: 10),
          ),
          Text(
            "Let's you in",
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
                letterSpacing: 1.75,
                wordSpacing: 1.25,
                fontStyle: FontStyle.normal),
          ),
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
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
            child: Row(children: [
              Expanded(
                  child: Divider(
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightBorderColor
                    : Constants.darkBorderColor,
              )),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "or",
                    style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        fontStyle: FontStyle.normal),
                  )),
              Expanded(
                  child: Divider(
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightBorderColor
                    : Constants.darkBorderColor,
              )),
            ]),
          ),
          const ScreenWidthButton(
              text: "Sign in with password",
              route: CascaRoutesNames.loginPage3),
          const ElseSigninSignupOptions(
                text_1: "Don't have an account? ",
                text_2: " Sign up",
                route: CascaRoutesNames.loginPage2),
        ],
      ),
    );
  }
}
