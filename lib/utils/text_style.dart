import 'package:sqf_lite_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle textField(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textFieldHint(BuildContext context) {
    return GoogleFonts.inter(
        fontSize: 14,
        color: Theme.of(context).focusColor,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5);
  }

  static TextStyle appBarStyle() {
    return GoogleFonts.inter(
        fontSize: 20,
        color: white0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0);
  }
}
