// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';

class FormFieldWidget extends StatefulWidget {
  final GlobalKey<FormState> fieldKey;
  final TextEditingController controller;
  bool obscureText;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final String? errorText;
  final IconData? prefixIcon;
  final bool showSuffixIcon;
  final String hintText;

  FormFieldWidget({
    Key? key,
    required this.fieldKey,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.onChanged,
    required this.keyboardType,
    required this.errorText,
    required this.prefixIcon,
    required this.showSuffixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  void _togglevisibility() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
      child: Form(
          key: widget.fieldKey,
          child: TextFormField(
            // autofocus: false,
            // focusNode: ,
            controller: widget.controller,
            obscureText: widget.obscureText,
            cursorColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightTextColor
                : Constants.darkTextColor,
            validator: widget.validator,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
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
                errorText: widget.errorText,
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
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightBorderColor
                            : Constants.darkBorderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    gapPadding: 24),
                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade600
                      : Colors.grey.shade300,
                  size: 18,
                ),
                suffixIcon: widget.showSuffixIcon
                    ? GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          widget.obscureText
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade600
                              : Colors.grey.shade300,
                          size: 18,
                        ),
                      )
                    : Icon(null),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.urbanist(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade600
                        : Colors.grey.shade300,
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.normal),
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
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.red.shade600
                            : Colors.red.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    gapPadding: 24),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).brightness == Brightness.light ? Colors.red.shade200 : Colors.red.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    gapPadding: 24)),
          )),
    );
  }
}
