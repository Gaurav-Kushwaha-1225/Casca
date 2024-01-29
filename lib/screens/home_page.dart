import 'package:casca/utils/consts.dart';
import 'package:casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back_rounded, leadingFunc: () {}),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 27,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/1.png",
              fit: BoxFit.contain,
              width: (MediaQuery.of(context).size.width - 140),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            "Let's you in",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 38,
                fontWeight: FontWeight.w400,
                color: Constants.lightTextColor,
                fontStyle: FontStyle.normal),
          ),
          const SizedBox(
            height: 26,
          ),
          
        ],
      ),
    );
  }
}
