import 'package:flutter/material.dart';

abstract class AppTheme {
  ThemeData get theme;

  TextTheme get textTheme;

  ColorScheme get colorScheme;

  static const fontFamily = 'PublicSans';
  static const fontFamilyEg = 'PublicSans';
}
