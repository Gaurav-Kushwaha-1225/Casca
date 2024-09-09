import 'dart:developer';

import 'package:Casca/config/routes/routes_consts.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:Casca/widgets/screen_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/data_sources/user_database.dart';
import '../../../../utils/consts.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';

class ProfileSetup extends StatefulWidget {
  final String email;
  final String password;
  const ProfileSetup({super.key, required this.email, required this.password});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
   TextEditingController nameTextEditingController =
      TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final GlobalKey<FormState> nameKey = GlobalKey();
  String? errorNameValue;

   TextEditingController userNameTextEditingController =
      TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final GlobalKey<FormState> userNameKey = GlobalKey();
  String? erroruserNameValue;

   TextEditingController dobTextEditingController =
      TextEditingController();
  final FocusNode dobFocusNode = FocusNode();
  final GlobalKey<FormState> dobKey = GlobalKey();
  String? errordobValue;

   TextEditingController phoneTextEditingController =
  TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final GlobalKey<FormState> phoneKey = GlobalKey();
  String? errorphoneValue;

  final List<String> gender = ["Male", "Female", "Prefer not to say"];
  String? _selectedGender;

   bool userLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
  listener: (context, state) {
    if(state is UserLoading) {
      userLoading = true;
    }
    else if (state is UserRegistered) {
      userLoading = false;
      // log(state.user.password);
      GoRouter.of(context)
          .goNamed(CascaRoutesNames.testingPage);
    } else if (state is UserError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingIcon: null,
            text: "Fill Your Profile",
            leadingFunc: () {
              log('AppBar BackButton');
              SystemNavigator.pop();
            }),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 24, right: 24, top: 24, bottom: 30),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? "assets/images/profile_light.png"
                        : "assets/images/profile_dark.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                child: Form(
                  key: nameKey,
                  child: TextFormField(
                    autofocus: false,
                    focusNode: nameFocusNode,
                    controller: nameTextEditingController,
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
                      return 'Enter a valid name.';
                    }
                      return null;
                    },
                    cursorColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightTextColor
                            : Constants.darkTextColor,
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
                        errorText: errorNameValue,
                        errorStyle: GoogleFonts.urbanist(
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.red.shade600
                                : Colors.red.shade300,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.normal),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        hintText: 'Full Name',
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
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                child: Form(
                  key: userNameKey,
                  child: TextFormField(
                    autofocus: false,
                    focusNode: userNameFocusNode,
                    controller: userNameTextEditingController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required.';
                      }
                      return null;
                    },
                    cursorColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightTextColor
                            : Constants.darkTextColor,
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
                        errorText: erroruserNameValue,
                        errorStyle: GoogleFonts.urbanist(
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.red.shade600
                                : Colors.red.shade300,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.normal),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        hintText: 'Username',
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
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                child: Form(
                  key: dobKey,
                  child: TextFormField(
                    autofocus: false,
                    focusNode: dobFocusNode,
                    controller: dobTextEditingController,
                    cursorColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Constants.lightTextColor
                            : Constants.darkTextColor,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Date of Birth is required";
                      }
                      return null;
                    },
                    onTap: () async {
                      DateTime date = DateTime.now();
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950, 1, 1),
                          lastDate: DateTime.now(),
                          ))!;

                      dobTextEditingController.text =
                          date.toString().substring(0, 10);
                    },
                    keyboardType: TextInputType.datetime,
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
                        errorText: errordobValue,
                        errorStyle: GoogleFonts.urbanist(
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.red.shade600
                                : Colors.red.shade300,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.normal),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        suffixIcon: Icon(
                          Icons.date_range_rounded,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                          size: 18,
                        ),
                        hintText: 'Date of Birth',
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
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                child: TextFormField(
                  autofocus: false,
                  readOnly: true,
                  initialValue: widget.email,
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        gapPadding: 24),
                    suffixIcon: Icon(
                      Icons.email_outlined,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        gapPadding: 24),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                child: Form(
                  key: phoneKey,
                  child: TextFormField(
                    autofocus: false,
                    focusNode: phoneFocusNode,
                    controller: phoneTextEditingController,
                    cursorColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Constants.lightTextColor
                        : Constants.darkTextColor,
                    validator: (value) {
                      if(value!.length != 10) {
                        return "Enter a valid Phone Number.";
                      }
                      return null;
                    },
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
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
                        errorText: errorphoneValue,
                        errorStyle: GoogleFonts.urbanist(
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.red.shade600
                                : Colors.red.shade300,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.normal),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        hintText: 'Phone Number',
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
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            gapPadding: 24),
                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade600 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300), borderRadius: const BorderRadius.all(Radius.circular(12)), gapPadding: 24)),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightBorderColor
                                      : Constants.darkBorderColor),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                              gapPadding: 24),
                          // TODO: Change fill color according to UI when in focus and dark theme or light theme
                          fillColor: Theme.of(context).brightness == Brightness.light
                              ? Constants.lightCardFillColor
                              : Constants.darkCardFillColor,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).brightness == Brightness.light
                                      ? Constants.lightSecondary
                                      : Constants.darkSecondary),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              gapPadding: 24),
                      ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          value: _selectedGender,
                          isDense: true,
                          hint: Text("Gender", style: GoogleFonts.urbanist(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                              letterSpacing: 1.2,
                              fontStyle: FontStyle.normal)),
                          dropdownColor: Theme.of(context).brightness == Brightness.light
                              ? Constants.lightBorderColor
                              : Constants.darkBorderColor,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedGender = newValue;
                            });
                      },
                      items: gender.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              letterSpacing: 1.2,
                              fontStyle: FontStyle.normal)),
                        );
                      }).toList(),
                    ),
                  ),
                );
              })
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 35),
              ),
            ),
            SliverToBoxAdapter(
              child: ScreenWidthButton(
                text: "Continue",
                route: CascaRoutesNames.testingPage,
                buttonFunc: () async {
                  final bool isValidName = nameKey.currentState!.validate();
                  final bool isValidUsername = userNameKey.currentState!.validate();
                  final bool isValidDOB = dobKey.currentState!.validate();
                  final bool isValidPhone = phoneKey.currentState!.validate();

                  if(_selectedGender == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Select Gender"),
                          backgroundColor: Theme.of(context).brightness == Brightness.light
                              ? Constants.darkBorderColor : Constants.lightBorderColor
                        )
                    );
                  }

                  if(isValidName && isValidUsername && isValidDOB && isValidPhone && _selectedGender != null) {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                        SignupEvent(
                            username: userNameTextEditingController.text,
                            name: nameTextEditingController.text,
                            dOB: dobTextEditingController.text,
                            email: widget.email,
                            password: widget.password,
                            mobNo: int.parse(phoneTextEditingController.text),
                            gender: _selectedGender!
                        ));
                  }
                }
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            )
          ],
        )),
);
  }
}
