import 'package:Casca/utils/consts.dart';
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
    return AppBar(
      title: Text(text),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Constants.lightPrimary
          : Constants.darkPrimary,
      titleTextStyle: GoogleFonts.urbanist(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
          letterSpacing: 1.5,
          fontStyle: FontStyle.normal),
      surfaceTintColor: Theme.of(context).brightness == Brightness.light
          ? Constants.darkBorderColor
          : Constants.lightBorderColor,
      titleSpacing: 0,
      leading: leadingIcon != null
          ? IconButton(
              onPressed: leadingFunc,
              icon: Icon(leadingIcon),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
