import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';

class PasswordUpdatedCard extends StatefulWidget {
  const PasswordUpdatedCard({super.key});

  @override
  State<PasswordUpdatedCard> createState() => _PasswordUpdatedCardState();
}

class _PasswordUpdatedCardState extends State<PasswordUpdatedCard> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Congratulations!",
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).brightness == Brightness.light
                  ? Constants.lightSecondary
                  : Constants.darkSecondary,
              fontStyle: FontStyle.normal)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Constants.lightCardFillColor
          : Constants.darkCardFillColor,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              "Your account is ready to use. You will be redirected to the HomePage in a few seconds.",
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  fontStyle: FontStyle.normal)),
          SizedBox(
            height: 25,
          ),
          CircularProgressIndicator(
            color: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary,
          )
        ],
      ),
    );
  }
}
