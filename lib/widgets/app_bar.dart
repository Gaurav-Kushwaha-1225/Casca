import 'package:casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String text;
  final Function() leadingFunc;
  const CustomAppBar(
      {super.key,
      required this.leadingIcon,
      required this.text,
      required this.leadingFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: AppBar(
        title: Text(
          text,
          textAlign: TextAlign.left,
          style: GoogleFonts.urbanist(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).brightness == Brightness.light
                  ? Constants.lightTextColor
                  : Constants.darkTextColor,
              letterSpacing: 1.75,
              wordSpacing: 1.25,
              fontStyle: FontStyle.normal),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Constants.lightPrimary
            : Constants.darkPrimary,
        leading: leadingIcon != null
            ? IconButton(
                onPressed: leadingFunc,
                icon: Icon(leadingIcon),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
