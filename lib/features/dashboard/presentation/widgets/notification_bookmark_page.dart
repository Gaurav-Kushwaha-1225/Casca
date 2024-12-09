import 'package:Casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class NotificationBookmarkPage extends StatefulWidget {
  final String service;
  const NotificationBookmarkPage({Key? key, required this.service})
      : super(key: key);

  @override
  State<NotificationBookmarkPage> createState() =>
      _NotificationBookmarkPageState();
}

class _NotificationBookmarkPageState extends State<NotificationBookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: CustomAppBar(
            text: widget.service,
            leadingFunc: () {
              Navigator.pop(context);
            },
            leadingIcon: Icons.arrow_back,
          )),
    );
  }
}
