import 'dart:developer';

import 'package:casca/utils/consts.dart';
import 'package:casca/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Text(
                "Create your\nAccount",
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
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: TextFormField(
                autofocus: false,
                focusNode: emailFocusNode,
                controller: emailTextEditingController,
                style: GoogleFonts.urbanist(
                    decoration: TextDecoration.none,
                    fontSize: 18,
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
                            const BorderRadius.all(Radius.circular(15)),
                        gapPadding: 24),
                    // TODO: prefix icon color when in focus
                    prefixIcon: Icon(
                      Icons.mail_rounded,
                      color: (emailFocusNode ==
                                  FocusManager.instance.primaryFocus) &&
                              Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : (emailFocusNode ==
                                      FocusManager.instance.primaryFocus) &&
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                              ? Constants.darkSecondary
                              : (emailFocusNode !=
                                          FocusManager.instance.primaryFocus) &&
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                      size: 25,
                    ),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.urbanist(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.normal),
                    // TODO: Change fill color according to UI when in focus and dark theme or light theme
                    fillColor: (emailFocusNode ==
                                FocusManager.instance.primaryFocus) &&
                            Theme.of(context).brightness == Brightness.light
                        ? Constants.lightSecondary
                        : (emailFocusNode == FocusManager.instance.primaryFocus) &&
                                Theme.of(context).brightness == Brightness.dark
                            ? Constants.darkSecondary
                            : (emailFocusNode != FocusManager.instance.primaryFocus) &&
                                    Theme.of(context).brightness ==
                                        Brightness.light
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
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Constants.lightSecondary : Constants.darkSecondary), borderRadius: const BorderRadius.all(Radius.circular(15)), gapPadding: 24)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: TextFormField(
                autofocus: false,
                focusNode: passwordFocusNode,
                controller: passwordTextEditingController,
                style: GoogleFonts.urbanist(
                    decoration: TextDecoration.none,
                    fontSize: 18,
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
                            const BorderRadius.all(Radius.circular(15)),
                        gapPadding: 24),
                    // TODO: prefix icon color when in focus
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: (passwordFocusNode ==
                                  FocusManager.instance.primaryFocus) &&
                              Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : (passwordFocusNode ==
                                      FocusManager.instance.primaryFocus) &&
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                              ? Constants.darkSecondary
                              : (passwordFocusNode !=
                                          FocusManager.instance.primaryFocus) &&
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                      size: 25,
                    ),
                    // TODO: Suffix icon change when pressed
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: (passwordFocusNode ==
                                  FocusManager.instance.primaryFocus) &&
                              Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : (passwordFocusNode ==
                                      FocusManager.instance.primaryFocus) &&
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                              ? Constants.darkSecondary
                              : (passwordFocusNode !=
                                          FocusManager.instance.primaryFocus) &&
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                      size: 25,
                    ),
                    hintText: 'Passowrd',
                    hintStyle: GoogleFonts.urbanist(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.normal),
                    // TODO: Change fill color according to UI when in focus and dark theme or light theme
                    fillColor: (passwordFocusNode ==
                                FocusManager.instance.primaryFocus) &&
                            Theme.of(context).brightness == Brightness.light
                        ? Constants.lightSecondary
                        : (passwordFocusNode == FocusManager.instance.primaryFocus) &&
                                Theme.of(context).brightness == Brightness.dark
                            ? Constants.darkSecondary
                            : (passwordFocusNode != FocusManager.instance.primaryFocus) &&
                                    Theme.of(context).brightness ==
                                        Brightness.light
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
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Constants.lightSecondary : Constants.darkSecondary), borderRadius: const BorderRadius.all(Radius.circular(15)), gapPadding: 24)),
              ),
            ),
          ]),
    );
  }
}
