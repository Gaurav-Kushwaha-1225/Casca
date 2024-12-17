// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:Casca/features/authentication/presentation/widgets/password_updated_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../data/data_sources/user_database.dart';
import 'package:Casca/config/routes/routes_consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';
import '../../data/models/user_model.dart';
import '../widgets/remember_me_check_box.dart';

class ForgotPassword3 extends StatefulWidget {
  String id;
  ForgotPassword3({super.key, required this.id});

  @override
  State<ForgotPassword3> createState() => _ForgotPassword3State();
}

class _ForgotPassword3State extends State<ForgotPassword3> {
  final TextEditingController passwordTextEditingController =
  TextEditingController();
  // final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController confirmPasswordTextEditingController =
  TextEditingController();
  // final FocusNode confirmPasswordFocusNode = FocusNode();

  String? errorConfirmPasswordValue;
  final GlobalKey<FormState> passwordKey = GlobalKey();

  String? errorPasswordValue;
  final GlobalKey<FormState> confirmPasswordKey = GlobalKey();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  void _togglevisibilityPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  void _togglevisibilityConfirmPassword() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  bool createNewPasswordRememberMe = false;
  void handleRememberMeChange (bool value) {
    setState(() {
      createNewPasswordRememberMe = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<User?> _updatePassword(String id) async {
    bool isSuccess = await CascaUsersDB.updatePassword(id, passwordTextEditingController.text);
    if (isSuccess) {
      List<User> user = await CascaUsersDB.getUserById(id);
      return user[0];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        text: "Create New Password",
        leadingIcon: null,
        leadingFunc: () {
          debugPrint('AppBar BackButton');
          SystemNavigator.pop();
        },
      ),
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
                    ? "assets/images/CreateNewPasswordLight.png"
                    : "assets/images/CreateNewPasswordDark.png",
                fit: BoxFit.contain,
                width: (MediaQuery.of(context).size.width - 80),
              ),
            ),
            const Expanded(
                child: SizedBox(
                  height: 10,
                )),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24),
              width: MediaQuery.of(context).size.width - 48,
              child: Text(
                "Create Your New Password",
                textAlign: TextAlign.start,
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
            SizedBox(height: 15),
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
                    } else if (confirmPasswordTextEditingController.text != value) {
                      return "Invalid Confirm Password.";
                    }
                    return null;
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
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        size: 18,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibilityPassword();
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
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
              child: Form(
                key: confirmPasswordKey,
                child: TextFormField(
                  // autofocus: false,
                  // focusNode: confirmPasswordFocusNode,
                  controller: confirmPasswordTextEditingController,
                  obscureText: !_showConfirmPassword,
                  cursorColor: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password.";
                    } else if (passwordTextEditingController.text != value) {
                      return "Invalid Confirm Password.";
                    }
                    return null;
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
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                        size: 18,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibilityConfirmPassword();
                        },
                        child: Icon(
                          _showConfirmPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          size: 18,
                        ),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.urbanist(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness == Brightness.light  ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.normal),
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
            RememberMeCheckBox(passwordRememberMe: createNewPasswordRememberMe, onChanged: handleRememberMeChange),
            Expanded(child: SizedBox(
              height: 0,
            )),
            ScreenWidthButton(
                text: "Continue",
                route: CascaRoutesNames.dashboard,
                buttonFunc: () async {
                  bool? isPasswordValid = passwordKey.currentState?.validate();
                  bool? isConfirmPasswordValid = confirmPasswordKey.currentState?.validate();

                  if(isConfirmPasswordValid! && isPasswordValid!) {
                    User? user = await _updatePassword(widget.id);

                    showDialog(
                      context: context,
                      builder: (_) => PasswordUpdatedCard(),
                    );

                    await Future.delayed(const Duration(seconds: 5));
                    Navigator.pop(context);
                    if (user != null) {
                      if (createNewPasswordRememberMe) {
                        final flutterSecureStorage = FlutterSecureStorage();
                        flutterSecureStorage.write(key: 'user', value: jsonEncode(user.toMap()));
                      }
                      GoRouter.of(context).goNamed(CascaRoutesNames.dashboard, pathParameters: {'user': jsonEncode(user.toMap())});
                    } else {
                      GoRouter.of(context).goNamed(CascaRoutesNames.authOnboardingPage);
                    }
                  }
                }),
            SizedBox(
              height: 40,
            )
          ]),
    );
  }
}
