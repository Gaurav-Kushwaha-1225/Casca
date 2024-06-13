import 'package:casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPageDivider extends StatefulWidget {
  final String text;
  const AuthPageDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<AuthPageDivider> createState() => _AuthPageDividerState();
}

class _AuthPageDividerState extends State<AuthPageDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(left: 24, right: 24),
              child: Row(children: [
                Expanded(
                    child: Divider(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightBorderColor
                      : Constants.darkBorderColor,
                )),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      widget.text,
                      style: GoogleFonts.urbanist(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                          fontStyle: FontStyle.normal),
                    )),
                Expanded(
                    child: Divider(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightBorderColor
                      : Constants.darkBorderColor,
                )),
              ]),
            );
  }
}