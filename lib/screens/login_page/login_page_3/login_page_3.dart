import 'dart:developer';

import 'package:casca/screens/login_page/loca_widgets/auth_page_divider.dart';
import 'package:casca/screens/login_page/loca_widgets/else_signin_signup_options.dart';
import 'package:casca/screens/login_page/loca_widgets/remember_me_check_box.dart';
import 'package:casca/screens/login_page/loca_widgets/sign_in_options.dart';
import 'package:casca/utils/consts.dart';
import 'package:casca/widgets/app_bar.dart';
import 'package:casca/screens/login_page/loca_widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/routes_consts.dart';

class LoginPage3 extends StatefulWidget {
  const LoginPage3({super.key});

  @override
  State<LoginPage3> createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  bool loginPasswordRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back_rounded,
          leadingFunc: () {
            log('AppBar BackButton');
          }),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 25, top: 40),
              child: Text(
                "Login to your\nAccount",
                style: GoogleFonts.urbanist(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  letterSpacing: 1.75,
                  wordSpacing: 1.25,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            // const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
              height: 53,
              child: TextFormField(
                autofocus: false,
                focusNode: emailFocusNode,
                controller: emailTextEditingController,
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
                      Icons.mail_rounded,
                      color:
                          // (emailFocusNode ==
                          //             FocusManager.instance.primaryFocus) &&
                          //         Theme.of(context).brightness == Brightness.light
                          //     ? Constants.lightSecondary
                          //     : (emailFocusNode ==
                          //                 FocusManager.instance.primaryFocus) &&
                          //             Theme.of(context).brightness ==
                          //                 Brightness.dark
                          //         ? Constants.darkSecondary
                          //         : (emailFocusNode !=
                          //                     FocusManager.instance.primaryFocus) &&
                          Theme.of(context).brightness == Brightness.light
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
                    fillColor:
                        // (emailFocusNode ==
                        //             FocusManager.instance.primaryFocus) &&
                        //         Theme.of(context).brightness == Brightness.light
                        //     ? Constants.lightSecondary
                        //     : (emailFocusNode == FocusManager.instance.primaryFocus) &&
                        //             Theme.of(context).brightness == Brightness.dark
                        //         ? Constants.darkSecondary
                        //         : (emailFocusNode != FocusManager.instance.primaryFocus) &&
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightCardFillColor
                            : Constants.darkCardFillColor,
                    // focusColor: (emailFocusNode ==
                    //             FocusManager.instance.primaryFocus) &&
                    //         Theme.of(context).brightness == Brightness.light
                    //     ? Constants.lightSecondary
                    //     : (emailFocusNode == FocusManager.instance.primaryFocus) &&
                    //             Theme.of(context).brightness == Brightness.dark
                    //         ? Constants.darkSecondary
                    //         : (emailFocusNode != FocusManager.instance.primaryFocus) &&
                    //                 Theme.of(context).brightness == Brightness.light
                    //             ? Constants.lightSecondary.withOpacity(0.05)
                    //             : Constants.darkSecondary.withOpacity(0.05),
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
                      color:
                          // (passwordFocusNode ==
                          //             FocusManager.instance.primaryFocus) &&
                          //         Theme.of(context).brightness == Brightness.light
                          //     ? Constants.lightSecondary
                          //     : (passwordFocusNode ==
                          //                 FocusManager.instance.primaryFocus) &&
                          //             Theme.of(context).brightness ==
                          //                 Brightness.dark
                          //         ? Constants.darkSecondary
                          //         : (passwordFocusNode !=
                          //                     FocusManager.instance.primaryFocus) &&
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                      size: 18,
                    ),
                    // TODO: Suffix icon change when pressed
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color:
                          // (passwordFocusNode ==
                          //             FocusManager.instance.primaryFocus) &&
                          //         Theme.of(context).brightness == Brightness.light
                          //     ? Constants.lightSecondary
                          //     : (passwordFocusNode ==
                          //                 FocusManager.instance.primaryFocus) &&
                          //             Theme.of(context).brightness ==
                          //                 Brightness.dark
                          //         ? Constants.darkSecondary
                          //         : (passwordFocusNode !=
                          //                     FocusManager.instance.primaryFocus) &&
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                      size: 18,
                    ),
                    hintText: 'Passowrd',
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
                    fillColor:
                        // (passwordFocusNode ==
                        //             FocusManager.instance.primaryFocus) &&
                        //         Theme.of(context).brightness == Brightness.light
                        //     ? Constants.lightSecondary
                        //     : (passwordFocusNode == FocusManager.instance.primaryFocus) &&
                        //             Theme.of(context).brightness == Brightness.dark
                        //         ? Constants.darkSecondary
                        //         : (passwordFocusNode != FocusManager.instance.primaryFocus) &&
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightCardFillColor
                            : Constants.darkCardFillColor,
                    // focusColor: (passwordFocusNode ==
                    //             FocusManager.instance.primaryFocus) &&
                    //         Theme.of(context).brightness == Brightness.light
                    //     ? Constants.lightSecondary
                    //     : (passwordFocusNode == FocusManager.instance.primaryFocus) &&
                    //             Theme.of(context).brightness == Brightness.dark
                    //         ? Constants.darkSecondary
                    //         : (passwordFocusNode != FocusManager.instance.primaryFocus) &&
                    //                 Theme.of(context).brightness == Brightness.light
                    //             ? Constants.lightSecondary.withOpacity(0.05)
                    //             : Constants.darkSecondary.withOpacity(0.05),
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
            RememberMeCheckBox(passwordRememberMe: loginPasswordRememberMe),
            const SizedBox(
              height: 5,
            ),
            const ScreenWidthButton(
                text: "Sign up", route: CascaRoutesNames.loginPage1),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  log('Forgot Password');
                  // GoRouter.of(context)
                  //     .pushNamed(CascaRoutesNames.loginPage2);
                },
                child: Text("Forgot the Password?",
                    style: GoogleFonts.urbanist(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : Constants.darkSecondary,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            const Expanded(
              child: SizedBox(height: 20),
            ),
            const AuthPageDivider(text: "or continue with"),
            const SignInOptionsButton(),
            const Expanded(child: SizedBox()),
            const ElseSigninSignupOptions(
                text_1: "Don't have an account? ",
                text_2: " Sign up",
                route: CascaRoutesNames.loginPage2),
          ]),
    );
  }
}
