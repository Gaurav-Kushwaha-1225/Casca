import 'dart:convert';
import 'dart:developer';

import 'package:Casca/features/authentication/presentation/widgets/auth_page_divider.dart';
import 'package:Casca/features/authentication/presentation/widgets/else_signin_signup_options.dart';
import 'package:Casca/features/authentication/presentation/widgets/form_field.dart';
import 'package:Casca/features/authentication/presentation/widgets/main_text.dart';
import 'package:Casca/features/authentication/presentation/widgets/remember_me_check_box.dart';
import 'package:Casca/features/authentication/presentation/widgets/social_signin_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/routes_consts.dart';
import 'package:Casca/utils/consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/data_sources/user_database.dart';
import '../../data/models/user_model.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';

class AuthenticationLoginPage extends StatefulWidget {
  const AuthenticationLoginPage({super.key});

  @override
  State<AuthenticationLoginPage> createState() =>
      _AuthenticationLoginPageState();
}

class _AuthenticationLoginPageState extends State<AuthenticationLoginPage> {
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

  bool _isPasswordValid = false;
  bool _isEmailValid = false;

  bool loginPasswordRememberMe = false;
  void handleRememberMeChange (bool value) {
    setState(() {
      loginPasswordRememberMe = value;
    });
  }

  bool userLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is UserLoading) {
          userLoading = true;
        } else if (state is UserLoaded) {
          userLoading = false;
          GoRouter.of(context)
              .goNamed(CascaRoutesNames.dashboard, pathParameters: {'user': jsonEncode(state.user.toJson())});
        } else if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
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
              FormFieldWidget(
                  fieldKey: emailKey,
                  controller: emailTextEditingController,
                  obscureText: false,
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
                    final List<User> users = await CascaUsersDB.getUserByEmail(
                        emailTextEditingController.text);
                    if (users.length == 1) {
                      _isEmailValid = true;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  errorText: errorEmailValue,
                  prefixIcon: Icons.mail_rounded,
                  showSuffixIcon: false,
                  hintText: "Email"),
              FormFieldWidget(
                  fieldKey: passwordKey,
                  controller: passwordTextEditingController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password.";
                    } else if (!_isPasswordValid) {
                      return "Password or Email is incorrect.";
                    }
                    return null;
                  },
                  onChanged: (String? value) async {
                    final List<User> users = await CascaUsersDB.getUserByEmail(
                        emailTextEditingController.text);
                    if (users.length == 1) {
                      if (users.first.password == value) {
                        _isPasswordValid = true;
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  errorText: errorPasswordValue,
                  prefixIcon: Icons.lock_outline_rounded,
                  showSuffixIcon: true,
                  hintText: "Password"),
              RememberMeCheckBox(passwordRememberMe: loginPasswordRememberMe, onChanged: handleRememberMeChange),
              const SizedBox(
                height: 5,
              ),
              ScreenWidthButton(
                  text: "Sign in",
                  route: CascaRoutesNames.dashboard,
                  buttonFunc: () {
                    final bool isValidEmail = emailKey.currentState!.validate();
                    final bool isValidPassword =
                        passwordKey.currentState!.validate();
                    if (isValidEmail && isValidPassword) {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                          LoginEvent(
                              email: emailTextEditingController.text,
                              password: passwordTextEditingController.text,
                              rememberMeCheckbox: loginPasswordRememberMe));
                    }
                  },
                  isLoading: userLoading,
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    log('Forgot Password');
                    final bool isValidEmail = emailKey.currentState!.validate();
                    if (isValidEmail) {
                      if (!mounted) return;
                      GoRouter.of(context).pushNamed(
                          CascaRoutesNames.forgotPassword1,
                          pathParameters: {
                            'email': jsonEncode(emailTextEditingController.text)
                          });
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
                route: CascaRoutesNames.authSignupPage,
                buttonFunc: () {
                  GoRouter.of(context)
                      .pushReplacementNamed(CascaRoutesNames.authSignupPage);
                },
              ),
            ]),
      ),
    );
  }
}
