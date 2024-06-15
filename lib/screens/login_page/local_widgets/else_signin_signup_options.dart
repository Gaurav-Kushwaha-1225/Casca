import 'dart:developer';

import 'package:casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ElseSigninSignupOptions extends StatefulWidget {
  final String text_1;
  final String text_2;
  final String route;
  final Function() buttonFunc;
  const ElseSigninSignupOptions({
    Key? key,
    required this.text_1,
    required this.text_2,
    required this.route,
    required this.buttonFunc
  }) : super(key: key);

  @override
  State<ElseSigninSignupOptions> createState() =>
      _ElseSigninSignupOptionsState();
}

class _ElseSigninSignupOptionsState extends State<ElseSigninSignupOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.text_1,
              style: GoogleFonts.urbanist(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade600
                    : Colors.grey.shade300,
                fontStyle: FontStyle.normal,
              )),
          GestureDetector(
            onTap: widget.buttonFunc,
            child: Text(widget.text_2,
                style: GoogleFonts.urbanist(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightSecondary
                      : Constants.darkSecondary,
                  fontStyle: FontStyle.normal,
                )),
          ),
        ],
      ),
    );
  }
}
