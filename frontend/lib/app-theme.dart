import 'package:flutter/material.dart';

class AppTheme {
  static const mainHex = 0xFF47B6BD;
  static const Color mainColor = Color(mainHex);
  static const logoFile = 'assets/lama.png';
  static const logoBgFile = 'assets/lama-bg.png';
  static const MaterialColor mainMaterial = MaterialColor(mainHex, {
    50:  mainColor,
    100: mainColor,
    200: mainColor,
    300: mainColor,
    400: mainColor,
    500: mainColor,
    600: mainColor,
    700: mainColor,
    800: mainColor,
    900: mainColor,
  });
  static Color grey = Color(0xFF546E7A);
}
