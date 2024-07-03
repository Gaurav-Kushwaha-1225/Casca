import 'dart:convert';
import 'dart:developer';

import 'package:Casca/screens/login_page/local_widgets/auth_page_divider.dart';
import 'package:Casca/screens/login_page/local_widgets/else_signin_signup_options.dart';
import 'package:Casca/screens/login_page/local_widgets/main_text.dart';
import 'package:Casca/screens/login_page/local_widgets/remember_me_check_box.dart';
import 'package:Casca/screens/login_page/local_widgets/sign_in_options.dart';
import 'package:Casca/services/database/casca_db.dart';
import 'package:Casca/utils/consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../features/authentication/data/models/users.dart';
import '../../../config/routes/routes_consts.dart';

class LoginPage3 extends StatefulWidget {
  const LoginPage3({super.key});

  @override
  State<LoginPage3> createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  // final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  // final FocusNode passwordFocusNode = FocusNode();

  String? errorEmailValue;
  final GlobalKey<FormState> emailKey = GlobalKey();

  String? errorPasswordValue;
  final GlobalKey<FormState> passwordKey = GlobalKey();

  bool _showPassword = false;
  bool _isPasswordValid = false;
  bool _isEmailValid = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool loginPasswordRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back_rounded,
          text: "",
          leadingFunc: () {
            log('AppBar BackButton');
            Navigator.pop(context);
          }),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            Container(
                margin: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 35, top: 50),
                child: const MainText(text: "Login to your\nAccount")),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
              child: Form(
                key: emailKey,
                child: TextFormField(
                  // autofocus: false,
                  // focusNode: emailFocusNode,
                  controller: emailTextEditingController,
                  cursorColor: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  validator: (value) {
                    final bool emailPatternValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (!emailPatternValid) {
                      return "Please enter a valid email address.";
                    } else if (!_isEmailValid) {
                      return "Invalid email address.";
                    }
                    return null;
                  },
                  onChanged: (String? value) async {
                    final List<User> users = await CascaUsersDB.getUserByEmail(emailTextEditingController.text);
                    if(users.length == 1) {
                      _isEmailValid = true;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.urbanist(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightTextColor
                          : Constants.darkTextColor,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.normal),
                  decoration: InputDecoration(
                      errorText: errorEmailValue,
                      errorStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.red.shade600
                              : Colors.red.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightBorderColor
                                      : Constants.darkBorderColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          gapPadding: 24),
                      // TODO: prefix icon color when in focus
                      prefixIcon: Icon(
                        Icons.mail_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        size: 18,
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
                      // TODO: Change fill color according to UI when in focus and dark theme or light theme
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightCardFillColor
                          : Constants.darkCardFillColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightSecondary
                                      : Constants.darkSecondary),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          gapPadding: 24),
                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
              child: Form(
                key: passwordKey,
                child: TextFormField(
                  // autofocus: false,
                  // focusNode: passwordFocusNode,
                  controller: passwordTextEditingController,
                  obscureText: !_showPassword,
                  cursorColor: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password.";
                    } else if (!_isPasswordValid) {
                      return "Password or Email is incorrect.";
                    }
                    return null;
                  },
                  onChanged: (String? value) async {
                    final List<User> users = await CascaUsersDB.getUserByEmail(emailTextEditingController.text);
                    if(users.length == 1) {
                      if(users.first.password == value) {
                        _isPasswordValid = true;
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.urbanist(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightTextColor
                          : Constants.darkTextColor,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.normal),
                  decoration: InputDecoration(
                      errorText: errorPasswordValue,
                      errorStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.red.shade600
                              : Colors.red.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightBorderColor
                                      : Constants.darkBorderColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          gapPadding: 24),
                      // TODO: prefix icon color when in focus
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                                ? Colors.grey.shade600
                                : Colors.grey.shade300,
                        size: 18,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                          size: 18,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
                      // TODO: Change fill color according to UI when in focus and dark theme or light theme
                      fillColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Constants.lightCardFillColor
                              : Constants.darkCardFillColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightSecondary
                                      : Constants.darkSecondary),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          gapPadding: 24),
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                ),
              ),
            ),
            RememberMeCheckBox(passwordRememberMe: loginPasswordRememberMe),
            const SizedBox(
              height: 5,
            ),
            ScreenWidthButton(
              text: "Sign in",
              route: CascaRoutesNames.testingPage,
              buttonFunc: () {
                final bool isValidEmail = emailKey.currentState!.validate();
                final bool isValidPassword = passwordKey.currentState!.validate();
                // log(emailTextEditingController.text);
                // log(passwordTextEditingController.text);
                if(isValidEmail && isValidPassword) {
                  if(!mounted) return;
                  GoRouter.of(context).pushNamed(
                      CascaRoutesNames.testingPage);
                }
              }),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  log('Forgot Password');
                  final bool isValidEmail = emailKey.currentState!.validate();
                  if(isValidEmail) {
                    if(!mounted) return;
                    GoRouter.of(context).pushNamed(
                        CascaRoutesNames.forgotPassword1,
                    pathParameters: {'email' : jsonEncode(emailTextEditingController.text)});
                  }
                },
                child: Text("Forgot the Password?",
                    style: GoogleFonts.urbanist(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : Constants.darkSecondary,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            const Expanded(
              child: SizedBox(height: 20),
            ),
            const AuthPageDivider(text: "or continue with"),
            const SignInOptionsButton(),
            const Expanded(child: SizedBox()),
            ElseSigninSignupOptions(
              text_1: "Don't have an account? ",
              text_2: " Sign up",
              route: CascaRoutesNames.loginPage2,
              buttonFunc: () {
                GoRouter.of(context)
                    .pushReplacementNamed(CascaRoutesNames.loginPage2);
              },
            ),
          ]),
    );
  }
}
