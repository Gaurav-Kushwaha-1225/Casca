import 'dart:developer';

import 'package:casca/screens/login_page/loca_widgets/auth_page_divider.dart';
import 'package:casca/screens/login_page/loca_widgets/else_signin_signup_options.dart';
import 'package:casca/screens/login_page/loca_widgets/main_text.dart';
import 'package:casca/screens/login_page/loca_widgets/remember_me_check_box.dart';
import 'package:casca/screens/login_page/loca_widgets/sign_in_options.dart';
import 'package:casca/utils/consts.dart';
import 'package:casca/utils/routes_consts.dart';
import 'package:casca/widgets/app_bar.dart';
import 'package:casca/screens/login_page/loca_widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  String? errorTextValue;
  final GlobalKey<FormState> emailKey = GlobalKey();

  bool signupPasswordRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back_rounded,
          leadingFunc: () {
            log('AppBar BackButton');
            SystemNavigator.pop();
          }),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            Container(
                margin: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 35, top: 50),
                child: const MainText(text: "Create your\nAccount")),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
              child: Form(
                key: emailKey,
                child: TextFormField(
                  autofocus: false,
                  focusNode: emailFocusNode,
                  controller: emailTextEditingController,
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (!emailValid) {
                      return "Please enter a valid email address.";
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.urbanist(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightTextColor
                          : Constants.darkTextColor,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.normal),
                  decoration: InputDecoration(
                      errorText: errorTextValue,
                      errorStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.red.shade600
                              : Colors.red.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightBorderColor
                                      : Constants.darkBorderColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          gapPadding: 24),
                      // TODO: prefix icon color when in focus
                      prefixIcon: Icon(
                        Icons.mail_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        size: 18,
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
                      // TODO: Change fill color according to UI when in focus and dark theme or light theme
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightCardFillColor
                          : Constants.darkCardFillColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightSecondary
                                      : Constants.darkSecondary),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          gapPadding: 24),
                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 5),
              height: 53,
              child: TextFormField(
                autofocus: false,
                focusNode: passwordFocusNode,
                controller: passwordTextEditingController,
                style: GoogleFonts.urbanist(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightTextColor
                        : Constants.darkTextColor,
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.normal),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        gapPadding: 24),
                    // TODO: prefix icon color when in focus
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade300,
                      size: 18,
                    ),
                    // TODO: Suffix icon change when pressed
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade300,
                      size: 18,
                    ),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.urbanist(
                        decoration: TextDecoration.none,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.normal),
                    // TODO: Change fill color according to UI when in focus and dark theme or light theme
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightCardFillColor
                        : Constants.darkCardFillColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        gapPadding: 24)),
              ),
            ),
            RememberMeCheckBox(passwordRememberMe: signupPasswordRememberMe),
            const SizedBox(
              height: 5,
            ),
            // TODO: random page allocation
            ScreenWidthButton(
                text: "Sign up",
                route: CascaRoutesNames.loginPage1,
                buttonFunc: () {
                  final bool isValid = emailKey.currentState!.validate();
                  log(emailTextEditingController.text);
                  log(passwordTextEditingController.text);
                }),
            const Expanded(
              child: SizedBox(height: 50),
            ),
            const AuthPageDivider(text: "or continue with"),
            const SignInOptionsButton(),
            const Expanded(child: SizedBox()),
            const ElseSigninSignupOptions(
                text_1: "Already have an account? ",
                text_2: " Sign in",
                route: CascaRoutesNames.loginPage3),
          ]),
    );
  }
}
