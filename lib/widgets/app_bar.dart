import 'package:Casca/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String text;
  final Function() leadingFunc;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key,
      this.leadingIcon,
      required this.text,
      required this.leadingFunc,
      this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingIcon != null
              ? IconButton(
                  onPressed: leadingFunc,
                  icon: Icon(
                    leadingIcon,
                    size: 28,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightTextColor
                        : Constants.darkTextColor,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                )
              : GestureDetector(
                  onTap: leadingFunc,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset(
                            "assets/icons/icon.png",
                          ))),
                ),
          SizedBox(
            width: 5,
          ),
          Text(text),
          Expanded(child: SizedBox()),
        ],
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Constants.lightPrimary
          : Constants.darkPrimary,
      titleTextStyle: GoogleFonts.urbanist(
          fontSize: 21,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
          letterSpacing: 1.5,
          fontStyle: FontStyle.normal),
      surfaceTintColor: Theme.of(context).brightness == Brightness.light
          ? Constants.darkBorderColor
          : Constants.lightBorderColor,
      titleSpacing: 14,
      actions: actions,
    );
  }
}
