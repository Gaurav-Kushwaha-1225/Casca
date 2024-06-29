import 'dart:convert';
import 'dart:developer';

import 'package:Casca/screens/login_page/forgot_password_1/local_widgets/forgot_password_card.dart';
import 'package:Casca/utils/routes_consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/users.dart';
import '../../../services/database/casca_db.dart';
import '../../../utils/consts.dart';

class ForgotPassword1 extends StatefulWidget {
  String email;
  ForgotPassword1({super.key, required this.email});

  @override
  State<ForgotPassword1> createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
  bool _isSMS = true;
  bool _isEmail = false;
  late User user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    user = (await CascaUsersDB.getUserByEmail(widget.email))[0];
    setState(() {});;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingIcon: null,
            text: "Forgot Password",
            leadingFunc: () {
              log('AppBar BackButton');
              SystemNavigator.pop();
            }),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                  child: SizedBox(
                height: 10,
              )),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? "assets/images/ForgotPasswordLight.png"
                      : "assets/images/ForgotPasswordDark.png",
                  fit: BoxFit.contain,
                  width: (MediaQuery.of(context).size.width - 170),
                ),
              ),
              const Expanded(
                child: SizedBox(height: 10),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  "Select which contact details should we use to reset your password",
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
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSMS = true;
                    _isEmail = false;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightCardFillColor
                            : Constants.darkCardFillColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: _isSMS
                                ? Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary
                                : Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor)),
                    child: ForgotPasswordCard(
                      via: "via SMS:",
                      via_content: "+1 111 ******99",
                    )),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSMS = false;
                    _isEmail = true;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightCardFillColor
                            : Constants.darkCardFillColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: _isEmail
                                ? Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary
                                : Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor)),
                    child: ForgotPasswordCard(
                      via: "via Email:",
                      via_content: widget.email.substring(0, 4) +
                          "****" +
                          widget.email.substring(widget.email.length - 9),
                    )),
              ),
              Expanded(
                  child: SizedBox(
                height: 10,
              )),
              ScreenWidthButton(
                  text: "Continue",
                  route: CascaRoutesNames.forgotPassword2,
                  buttonFunc: () {
                    GoRouter.of(context).pushNamed(
                        CascaRoutesNames.forgotPassword2,
                        pathParameters: {
                          'isEmail': jsonEncode(_isEmail),
                          'codeLink': jsonEncode(_isEmail ? widget.email : user.mobNo.toString()),
                          'id': jsonEncode(user.id)
                        });
                    log("Worked Fine :)");
                  }),
              Expanded(
                  child: SizedBox(
                height: 10,
              )),
            ]));
  }
}
