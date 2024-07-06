import 'dart:developer';

import 'package:Casca/utils/consts.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/under_development_feature.dart';

class SignInOptionsButton extends StatefulWidget {
  const SignInOptionsButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInOptionsButton> createState() => _SignInOptionsButtonState();
}

class _SignInOptionsButtonState extends State<SignInOptionsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                log("Facebook Button Pressed");
                showDialog(
                    context: context,
                    builder: (ctx) => const UnderDevelopmentFeature(
                        text:
                        "Facebook Button Pressed feature is currently under development."));
              },
              child: Container(
                height: 50,
                width: 75,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightCardFillColor
                        : Constants.darkCardFillColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightBorderColor
                            : Constants.darkBorderColor)),
                child: Icon(Icons.facebook_rounded,
                    color: Colors.blue.shade900, size: 27),
              ),
            ),
            GestureDetector(
              onTap: () {
                log("Google Button Pressed");
                showDialog(
                    context: context,
                    builder: (ctx) => const UnderDevelopmentFeature(
                        text:
                        "Google Button Pressed feature is currently under development."));
              },
              child: Container(
                height: 50,
                width: 75,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightCardFillColor
                        : Constants.darkCardFillColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightBorderColor
                            : Constants.darkBorderColor)),
                child: Image.asset(
                  "assets/images/google_icon.png",
                  fit: BoxFit.scaleDown,
                  width: 0,
                  height: 0,
                  scale: 1.85,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                log("Apple Button Pressed");
                showDialog(
                    context: context,
                    builder: (ctx) => const UnderDevelopmentFeature(
                        text:
                        "Apple Button Pressed feature is currently under development."));
              },
              child: Container(
                height: 50,
                width: 75,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightCardFillColor
                        : Constants.darkCardFillColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightBorderColor
                            : Constants.darkBorderColor)),
                child: const Icon(
                  Icons.apple_rounded,
                  size: 27,
                ),
              ),
            ),
          ]),
    );
  }
}
