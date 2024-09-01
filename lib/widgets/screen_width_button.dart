import 'dart:developer';

import 'package:Casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenWidthButton extends StatefulWidget {
  final String text;
  final String route;
  final Function() buttonFunc;
  bool isLoading;
  ScreenWidthButton(
      {Key? key,
      required this.text,
      required this.route,
      required this.buttonFunc,
      this.isLoading = false})
      : super(key: key);

  @override
  State<ScreenWidthButton> createState() => _ScreenWidthButtonState();
}

class _ScreenWidthButtonState extends State<ScreenWidthButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(widget.text);
        widget.buttonFunc();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightSecondary
              : Constants.darkSecondary,
          borderRadius: BorderRadius.circular(25),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? Constants.lightSecondary
                  : Constants.darkSecondary,
              blurRadius: 20.0,
              spreadRadius: -20.0,
              offset: const Offset(0.0, 20.0),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.text,
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                )),
            widget.isLoading ? SizedBox(width: 20) : SizedBox(),
            widget.isLoading ? SizedBox(height: 30, width: 30, child: CircularProgressIndicator()) : SizedBox()
          ],
        ),
      ),
    );
  }
}
