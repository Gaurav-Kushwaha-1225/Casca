import 'package:casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainText extends StatelessWidget {
  final String text;
  const MainText({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
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
    );
  }
}
