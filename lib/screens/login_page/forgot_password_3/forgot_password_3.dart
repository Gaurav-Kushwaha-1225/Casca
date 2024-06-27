import 'package:Casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword3 extends StatefulWidget {
  ForgotPassword3({super.key});

  @override
  State<ForgotPassword3> createState() => _ForgotPassword3State();
}

class _ForgotPassword3State extends State<ForgotPassword3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Create New Password",
        leadingIcon: null,
        leadingFunc: () {
          debugPrint('AppBar BackButton');
          SystemNavigator.pop();
        },
      ),
    );
  }
}
