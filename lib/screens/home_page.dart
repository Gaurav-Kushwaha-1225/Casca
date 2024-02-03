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
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/1.png",
              fit: BoxFit.contain,
              width: (MediaQuery.of(context).size.width - 170),
            ),
          ),
          const Expanded(child: SizedBox(height: 10),),
          Text(
            "Let's you in",
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: Constants.lightTextColor,
                letterSpacing: 1.75,
                wordSpacing: 1.25,
                fontStyle: FontStyle.normal),
          ),
          const Expanded(
            child: SizedBox(
              height: 13,
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 238, 238, 238))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook_rounded,
                  color: Colors.blue.shade900,
                  size: 32,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Continue with Facebook",
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Constants.lightTextColor,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.normal),
                )
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 13,
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 238, 238, 238))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google_icon.png",
                  fit: BoxFit.contain,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Continue with Google",
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Constants.lightTextColor,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.normal),
                )
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 13,
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 238, 238, 238))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.apple_rounded,
                  size: 32,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Continue with Apple",
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Constants.lightTextColor,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.normal),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Row(children: [
              const Expanded(
                  child: Divider(
                color: Color.fromARGB(255, 238, 238, 238),
              )),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "or",
                    style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.normal),
                  )),
              const Expanded(
                  child: Divider(
                color: Color.fromARGB(255, 238, 238, 238),
              )),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Constants.lightSecondary,
              borderRadius: BorderRadius.circular(25),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Constants.lightSecondary,
                  blurRadius: 20.0,
                  spreadRadius: -20.0,
                  offset: const Offset(0.0, 20.0),
                )
              ],
            ),
            alignment: Alignment.center,
            child: Text("Sign in with password",
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: GoogleFonts.urbanist(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.normal,
                    )),
                Text(" Sign up",
                    style: GoogleFonts.urbanist(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Constants.lightSecondary,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
