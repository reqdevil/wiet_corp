// ignore_for_file: file_names
import 'package:flutter/material.dart';

bool isDarkTheme = false;

class AppColors {
  // App Colors
  static const Color mainColor = Color(0xFF253085);

  static Color menuGradientTop = parseColor('#46579F');
  static Color menuGradientBottom = parseColor('#8393D4');

  // Classic Colors
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color red = Colors.red;

  static Color parseColor(String color) {
    String hex = color.replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";

    if (hex.length == 3) {
      hex =
          '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }

    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }
}
