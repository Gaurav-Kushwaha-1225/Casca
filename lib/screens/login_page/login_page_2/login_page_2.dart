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
                    prefixIcon: Icon(
                      Icons.mail_rounded,
                      // color: MaterialStateColor.resolveWith((states) => states
                      //             .contains(MaterialState.focused) &&
                      //         Theme.of(context).brightness == Brightness.light
                      //     ? Constants.lightSecondary
                      //     : MaterialStateColor.resolveWith(
                      //         (states) => states
                      //                     .contains(MaterialState.focused) &&
                      //                 Theme.of(context).brightness ==
                      //                     Brightness.dark
                      //             ? Constants.darkSecondary
                      //             : MaterialStateColor.resolveWith((states) =>
                      //                 !states.contains(MaterialState.focused) &&
                      //                         Theme.of(context).brightness ==
                      //                             Brightness.light
                      //                     ? Colors.grey.shade600
                      //                     : Colors.grey.shade300),
                      //       )),
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
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightCardFillColor
                        : Constants.darkCardFillColor,
                    // focusColor: Theme.of(context).brightness == Brightness.light
                    //     ? Constants.lightSecondary.withOpacity(0.05)
                    //     : Constants.darkSecondary.withOpacity(0.05),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        gapPadding: 24)),
              ),
            ),
          ]),
    );
  }
}
