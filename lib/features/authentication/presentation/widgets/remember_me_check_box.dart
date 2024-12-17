// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:Casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMeCheckBox extends StatefulWidget {
  bool passwordRememberMe;
  final ValueChanged<bool>? onChanged;
  RememberMeCheckBox({Key? key, required this.passwordRememberMe, this.onChanged})
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
            side: WidgetStateBorderSide.resolveWith(
              // ignore: deprecated_member_use
              (Set<WidgetState> states) {
                return BorderSide(color: Constants.lightSecondary);
              },
            ),
            value: widget.passwordRememberMe,
            onChanged: (x) {
              setState(() {
                widget.passwordRememberMe = !widget.passwordRememberMe;
              });

              if (widget.onChanged != null) {
                widget.onChanged!(widget.passwordRememberMe);
              }
            },
            focusColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary,
            hoverColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary,
            checkColor: Colors.white,
            fillColor: widget.passwordRememberMe
                ? WidgetStatePropertyAll(Constants.lightSecondary)
                : WidgetStatePropertyAll(
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
