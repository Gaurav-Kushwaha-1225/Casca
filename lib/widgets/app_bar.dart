import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final IconData leadingIcon;
  final Function() leadingFunc;
  const CustomAppBar(
      {super.key, required this.leadingIcon, required this.leadingFunc});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: AppBar(
        leading: IconButton(
            onPressed: widget.leadingFunc, icon: Icon(widget.leadingIcon)),
      ),
      
    );
  }
}
