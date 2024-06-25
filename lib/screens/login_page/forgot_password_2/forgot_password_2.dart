// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:math';

import 'package:Casca/utils/routes_consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/consts.dart';

class ForgotPassword2 extends StatefulWidget {
  bool isEmail;
  ForgotPassword2({super.key, required this.isEmail});

  @override
  State<ForgotPassword2> createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  Random randomCode = Random();
  int? codeVerify;

  TextEditingController codeVerifyTextEditingController =
      TextEditingController();
  final codeVerifyKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;

  int secondsRemaining = 60;
  bool isResendCodeEnabled = false;
  Timer? resendCodeTimer;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    resendCodeTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          isResendCodeEnabled = true;
        });
      }
    });
    codeVerify = randomCode.nextInt(1000) + 9000;
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    resendCodeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Forgot Password",
        leadingIcon: null,
        leadingFunc: () {
          debugPrint('AppBar BackButton');
          SystemNavigator.pop();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.isEmail
                  ? "Forgot Password Code has been send to abc@xyz.com"
                  : "Forgot Password Code has been send to +1 111 ******99",
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  letterSpacing: 1.2,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Form(
            key: codeVerifyKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PinCodeTextField(
                controller: codeVerifyTextEditingController,
                appContext: context,
                length: 4,
                animationType: AnimationType.fade,
                autovalidateMode: AutovalidateMode.disabled,
                validator: (v) {
                  if (v!.length != 4) {
                    return "Code is of 4 digits.";
                  } else if (v != codeVerify.toString()) {
                    return "Invalid Code.";
                  }
                  return null;
                },
                errorTextSpace: 30,
                errorTextDirection: TextDirection.ltr,
                enablePinAutofill: true,
                enabled: true,
                textStyle: GoogleFonts.urbanist(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightTextColor
                        : Constants.darkTextColor,
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.normal),
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(13),
                    fieldHeight: 50,
                    fieldWidth: 60,
                    activeColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightBorderColor
                            : Constants.darkBorderColor,
                    activeFillColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightCardFillColor
                            : Constants.darkCardFillColor,
                    selectedColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightSecondary.withOpacity(0.3)
                            : Constants.darkSecondary.withOpacity(0.3),
                    selectedFillColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightSecondary.withOpacity(0.1)
                            : Constants.darkSecondary.withOpacity(0.1),
                    inactiveColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightBorderColor
                            : Constants.darkBorderColor,
                    inactiveFillColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightCardFillColor
                            : Constants.darkCardFillColor,
                    errorBorderColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.red.shade200
                            : Colors.red.shade300),
                cursorColor: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
                onChanged: (value) {
                  debugPrint(value);
                  debugPrint(codeVerify.toString());
                },
                beforeTextPaste: (value) {
                  return false;
                },
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: isResendCodeEnabled
                ? GestureDetector(
                    onTap: () {},
                    child: Text("Resend Code",
                        style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightSecondary
                                  : Constants.darkSecondary,
                          fontStyle: FontStyle.normal,
                        )),
                  )
                : RichText(
                    text: TextSpan(
                        text: "Resend code in ",
                        style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightTextColor
                                    : Constants.darkTextColor,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.normal),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$secondsRemaining ",
                            style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary,
                                letterSpacing: 1.2,
                                fontStyle: FontStyle.normal),
                          ),
                          TextSpan(
                            text: "sec",
                            style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightTextColor
                                    : Constants.darkTextColor,
                                letterSpacing: 1.2,
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                  ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          ScreenWidthButton(
              text: "Verify",
              route: CascaRoutesNames.testingPage,
              buttonFunc: () {
                bool isValidCode = codeVerifyKey.currentState!.validate();

                if (isValidCode) {
                  GoRouter.of(context).pushNamed(CascaRoutesNames.testingPage);
                }
              }),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
