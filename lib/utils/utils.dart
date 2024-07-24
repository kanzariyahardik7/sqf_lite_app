import 'package:sqf_lite_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: green,
        textColor: white0,
        fontSize: 16.0);
  }

  static Widget loadingCircle() {
    return Positioned(
      child: Container(
        color: white1.withOpacity(0.7),
        child: const Center(
          child: CircularProgressIndicator(
            color: black0,
          ),
        ),
      ),
    );
  }
}
