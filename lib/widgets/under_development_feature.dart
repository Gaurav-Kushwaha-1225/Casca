import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/consts.dart';

class UnderDevelopmentFeature extends StatefulWidget {
  final String text;
  const UnderDevelopmentFeature({super.key, required this.text});

  @override
  State<UnderDevelopmentFeature> createState() =>
      _UnderDevelopmentFeatureState();
}

class _UnderDevelopmentFeatureState extends State<UnderDevelopmentFeature> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Under Construction",
          style: GoogleFonts.urbanist(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).brightness == Brightness.light
                  ? Constants.lightTextColor
                  : Constants.darkTextColor,
              fontStyle: FontStyle.normal)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Constants.lightCardFillColor
          : Constants.darkCardFillColor,
      content: Text(
          "${widget.text} This feature is like Schrödinger’s cat – it’s both there and not there.",
          style: GoogleFonts.urbanist(
              fontSize: 16,
              color: Theme.of(context).brightness == Brightness.light
                  ? Constants.lightTextColor
                  : Constants.darkTextColor,
              fontStyle: FontStyle.normal)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close Box',
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  fontStyle: FontStyle.normal)),
        ),
      ],
    );
  }
}
