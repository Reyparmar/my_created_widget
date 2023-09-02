import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  /// add fluttertoast packae
  static void showToast(
    String msg, [
    double? fontSize,
    Color? textColor,
    Color? backgroundColor,
    int? timeInSecForIosWeb,
    ToastGravity? gravity,
    Toast? toastLength,
  ]) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.TOP,
      timeInSecForIosWeb: timeInSecForIosWeb ?? 1,
      backgroundColor: backgroundColor ?? Colors.pink,
      textColor: textColor ?? Colors.white,
      fontSize: fontSize ?? 16.0,
    );
  }
}
