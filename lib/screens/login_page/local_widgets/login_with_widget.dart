import 'package:casca/utils/consts.dart';
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
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 24, right: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Constants.lightBorderColor)),
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
                color: Constants.lightTextColor,
                letterSpacing: 1.2,
                fontStyle: FontStyle.normal),
          )
        ],
      ),
    );
  }
}
