import 'dart:convert';
import 'dart:developer';

import 'package:Casca/features/authentication/presentation/widgets/auth_page_divider.dart';
import 'package:Casca/features/authentication/presentation/widgets/else_signin_signup_options.dart';
import 'package:Casca/features/authentication/presentation/widgets/main_text.dart';
import 'package:Casca/features/authentication/presentation/widgets/remember_me_check_box.dart';
import 'package:Casca/features/authentication/presentation/widgets/social_signin_options.dart';
import 'package:Casca/config/routes/routes_consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/signup_user.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../widgets/form_field.dart';

class AuthenticationSignupPage extends StatefulWidget {
  const AuthenticationSignupPage({super.key});

  @override
  State<AuthenticationSignupPage> createState() =>
      _AuthenticationSignupPageState();
}

class _AuthenticationSignupPageState extends State<AuthenticationSignupPage> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  String? errorEmailValue;
  final GlobalKey<FormState> emailKey = GlobalKey();

  String? errorPasswordValue;
  final GlobalKey<FormState> passwordKey = GlobalKey();

  bool signupPasswordRememberMe = false;
  void handleRememberMeChange (bool value) {
    setState(() {
      signupPasswordRememberMe = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(
        loginUser: RepositoryProvider.of<LoginUser>(context),
        signupUser: RepositoryProvider.of<SignupUser>(context),
      ),
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
                  child: const MainText(text: "Create your\nAccount")),
              const Expanded(child: SizedBox()),
              FormFieldWidget(
                  fieldKey: emailKey,
                  controller: emailTextEditingController,
                  obscureText: false,
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (!emailValid) {
                      return "Please enter a valid email address.";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String? value) {},
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
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String? value) {},
                  keyboardType: TextInputType.text,
                  errorText: errorPasswordValue,
                  prefixIcon: Icons.lock_outline_rounded,
                  showSuffixIcon: true,
                  hintText: "Password"),
              RememberMeCheckBox(passwordRememberMe: signupPasswordRememberMe, onChanged: handleRememberMeChange),
              const SizedBox(
                height: 5,
              ),
              ScreenWidthButton(
                  text: "Sign up",
                  route: CascaRoutesNames.profileSetup,
                  buttonFunc: () {
                    final bool isValidEmail = emailKey.currentState!.validate();
                    final bool isValidPassword =
                        passwordKey.currentState!.validate();
                    if (isValidEmail && isValidPassword) {
                      GoRouter.of(context).pushNamed(
                          CascaRoutesNames.profileSetup,
                          pathParameters: {
                            "email":
                                jsonEncode(emailTextEditingController.text),
                            "password":
                                jsonEncode(passwordTextEditingController.text),
                            "rememberMeCheckbox":
                                jsonEncode(signupPasswordRememberMe)
                          });
                    }
                  }),
              const Expanded(
                child: SizedBox(height: 900),
              ),
              const AuthPageDivider(text: "or continue with"),
              const SignInOptionsButton(),
              const Expanded(child: SizedBox()),
              ElseSigninSignupOptions(
                  text_1: "Already have an account? ",
                  text_2: " Sign in",
                  route: CascaRoutesNames.authLoginPage,
                  buttonFunc: () {
                    GoRouter.of(context)
                        .pushReplacementNamed(CascaRoutesNames.authLoginPage);
                  }),
            ]),
      ),
    );
  }
}
