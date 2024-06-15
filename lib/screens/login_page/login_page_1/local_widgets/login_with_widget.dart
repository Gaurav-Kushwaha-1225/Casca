import 'dart:developer';
import 'package:Casca/utils/consts.dart';
import 'package:Casca/widgets/under_development_feature.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWithWidget extends StatefulWidget {
  final Widget icon;
  final String text;
  const LoginWithWidget({super.key, required this.icon, required this.text});

  @override
  State<LoginWithWidget> createState() => _LoginWithWidgetState();
}

class _LoginWithWidgetState extends State<LoginWithWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(widget.text);
        showDialog(
            context: context,
            builder: (ctx) => UnderDevelopmentFeature(
                text:
                    "${widget.text} feature is currently under development."));
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Constants.lightCardFillColor
                : Constants.darkCardFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightBorderColor
                    : Constants.darkBorderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.text,
              style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  letterSpacing: 1.2,
                  fontStyle: FontStyle.normal),
            )
          ],
        ),
      ),
    );
  }
}
