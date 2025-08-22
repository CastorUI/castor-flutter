import 'package:flutter/material.dart';

// Text styles
class AppTextStyle {
    /// Form field label
  static const formLabel = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(26, 26, 26, 1));

  static const formLabelRequired =
      TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.red);

    /// Form field text
  static const formText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(26, 26, 26, 1));

  static const formLightGrayText =
      TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontSize: 14);
}
