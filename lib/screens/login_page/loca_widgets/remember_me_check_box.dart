// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMeCheckBox extends StatefulWidget {
  bool passwordRememberMe;
  RememberMeCheckBox({Key? key, this.passwordRememberMe = false})
      : super(key: key);

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            side: MaterialStateBorderSide.resolveWith(
              (Set<MaterialState> states) {
                return BorderSide(color: Constants.lightSecondary);
              },
            ),
            value: widget.passwordRememberMe,
            onChanged: (x) {
              widget.passwordRememberMe = !widget.passwordRememberMe;
              setState(() {
                log(widget.passwordRememberMe.toString());
              });
            },
            focusColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary,
            hoverColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary,
            checkColor: Colors.white,
            fillColor: widget.passwordRememberMe
                ? MaterialStatePropertyAll(Constants.lightSecondary)
                : MaterialStatePropertyAll(
                    Theme.of(context).brightness == Brightness.light
                        ? Constants.lightPrimary
                        : Constants.darkPrimary),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightSecondary
                        : Constants.darkSecondary)),
          ),
          Text(
            "Remember me",
            style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
                letterSpacing: 1.2,
                fontStyle: FontStyle.normal),
          )
        ],
      ),
    );
  }
}
