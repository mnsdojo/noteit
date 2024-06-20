import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF131313);
  static const Color orange = Color(0xFFFE6902);
  static const Color white = Color(0xFFF5F5F5);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: orange,
    scaffoldBackgroundColor: black,
  );
}
