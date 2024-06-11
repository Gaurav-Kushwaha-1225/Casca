import 'dart:developer';

import 'package:casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/consts.dart';

class ProfileSetup extends StatefulWidget {
  final String? email;
  const ProfileSetup({super.key, required this.email});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final GlobalKey<FormState> nameKey = GlobalKey();
  String? errorNameValue;

  final TextEditingController nicknameTextEditingController =
      TextEditingController();
  final FocusNode nicknameFocusNode = FocusNode();
  final GlobalKey<FormState> nicknameKey = GlobalKey();
  String? errorNicknameValue;

  final TextEditingController dobTextEditingController =
      TextEditingController();
  final FocusNode dobFocusNode = FocusNode();
  final GlobalKey<FormState> dobKey = GlobalKey();
  String? errordobValue;

  final TextEditingController phoneTextEditingController =
  TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final GlobalKey<FormState> phoneKey = GlobalKey();
  String? errorphoneValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return;
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
                  key: nicknameKey,
                  child: TextFormField(
                    autofocus: false,
                    focusNode: nicknameFocusNode,
                    controller: nicknameTextEditingController,
                    validator: (value) {
                      return;
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
                        errorText: errorNicknameValue,
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
                        hintText: 'Nickname',
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
                      return;
                    },
                    onTap: () async {
                      DateTime date = DateTime.now();
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950, 1, 1),
                          lastDate: DateTime.now()))!;

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
                      return;
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
                        suffixIcon: Icon(
                          Icons.date_range_rounded,
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          size: 18,
                        ),
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
          ],
        ));
  }
}
