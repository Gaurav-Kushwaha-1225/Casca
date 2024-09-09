import 'package:Casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordCard extends StatefulWidget {
  final String via;
  final String via_content;
  const ForgotPasswordCard({
    Key? key,
    required this.via,
    required this.via_content,
  }) : super(key: key);

  @override
  State<ForgotPasswordCard> createState() => _ForgotPasswordCardState();
}

class _ForgotPasswordCardState extends State<ForgotPasswordCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Material(
            color: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary.withOpacity(0.1)
                : Constants.darkSecondary.withOpacity(0.1),
            child: SizedBox(
              height: 65,
              width: 65,
              child: Icon(
                Icons.message_rounded,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightSecondary
                    : Constants.darkSecondary,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.via,
                style: GoogleFonts.urbanist(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey
                      : Colors.grey,
                  fontStyle: FontStyle.normal,
                )),
            Text(
              widget.via_content,
              style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  letterSpacing: 1.2,
                  fontStyle: FontStyle.normal),
            ),
          ],
        )
      ],
    );
  }
}
