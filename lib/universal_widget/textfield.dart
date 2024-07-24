// ignore_for_file: must_be_immutable

import 'package:sqf_lite_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final bool readOnly;
  final bool? isfeel;
  final TextInputType? textInputType;

  final ValueChanged<String> onChanged;
  GestureTapCallback? onTap;
  TextFieldWidget({
    this.readOnly = false,
    super.key,
    this.maxLines = 1,
    this.textInputType,
    required this.label,
    required this.text,
    required this.onChanged,
    this.onTap,
    this.isfeel = true,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        readOnly: widget.readOnly,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: -0.04,
          color: Theme.of(context).primaryColor,
        ),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        keyboardType: widget.textInputType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: gray.withOpacity(.5),
                width: 0.5,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: gray.withOpacity(.5),
                width: 0.5,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: gray.withOpacity(.5),
                width: 0.5,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: gray.withOpacity(.5),
                width: 0.5,
              )),
          filled: widget.isfeel,
          fillColor:
              widget.isfeel == true ? white5 : Theme.of(context).hintColor,
          labelText: widget.label,
          alignLabelWithHint: true,
          labelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: -0.04,
            color: Theme.of(context).primaryColor,
          ),
        ),
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      );
}
