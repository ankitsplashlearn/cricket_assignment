import 'package:flutter/material.dart';

class TextStyleUtil {
  static TextStyle whiteTextStyle({
    required double fontSize,
    bool bold = false,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static TextStyle blackTextStyle({
    required double fontSize,
    bool bold = false,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }
}
